//
//  AuthenticationViewModel.swift
//  BeReal
//
//  Created by Volkan Celik on 26/07/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthenticationViewModel:ObservableObject{
    @Published var name=""
    @Published var year=Year(day: "", month: "", year: "")
    @Published var country:Country=Country(isoCode: "US")
    @Published var phoneNumber=""
    
    @Published var otpText=""
    
    @Published var isLoading:Bool=false
    @Published var verificationCode:String=""
    
    @Published var navigationTag:String?
    
    @Published var errorMessage=""
    @Published var showAlert=false
    
    @Published var userSession:Firebase.User?
    @Published var currentUser:User?
    
    static let shared=AuthenticationViewModel()
    
    init(){
        userSession=Auth.auth().currentUser
        fetchUser()
    }
    
    func sendOtp() async {
        if self.isLoading{return}
        do{
            self.isLoading=true
            let result=try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(country.phoneCode)\(phoneNumber))", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading=false
                self.verificationCode=result
                self.navigationTag="VERIFICATION"
            }
        }catch{
            handleError(error: error.localizedDescription)
        }
        
    }
    
    func handleError(error:String){
        DispatchQueue.main.async {
            self.isLoading=false
            self.errorMessage=error
            self.showAlert.toggle()
        }
    }
    
    func verifyOtp() async {
        do{
            self.isLoading=true
            let credential=PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)
            let result=try await Auth.auth().signIn(with: credential)
            let db=Firestore.firestore()
            db.collection("users").document(result.user.uid).setData([
                "fullname":name,
                "date":year.date,
                "id":result.user.uid,
                "phone":"+\(country.phoneCode)\(phoneNumber)"
            ]){err in
                if let err=err{
                    print(err.localizedDescription)
                }
            }
            DispatchQueue.main.async { [self] in
                self.isLoading=false
                let user=result.user
                self.userSession=user
                self.currentUser=User(name: self.name, date: self.year.date,phone: "+\(country.phoneCode)\(phoneNumber)")
                print(user.uid)
            }
        }
        catch{
            print("ERROR")
            handleError(error: error.localizedDescription)
        }
    }
    
    func signOut(){
        self.userSession=nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        guard let uid=userSession?.uid else {return}
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, err in
            if let err=err{
                print(err.localizedDescription)
                return
            }
            
            guard let user=try? snapshot?.data(as: User.self) else {return}
            self.currentUser=user
        }
    }
    
    func saveUserData(data:[String:Any]) async{
        guard let userId=userSession?.uid else {return}
        do{
            try await Firestore.firestore().collection("users").document(userId).updateData(data)
        }
        catch{
            handleError(error: error.localizedDescription)
        }
    }
    
    func uploadProfileImage(image:UIImage,completion:@escaping (String)->Void){
        ImageUploader.uploadImage(image: image, type: .profile) { url in
            completion(url)
        }
    }
}
