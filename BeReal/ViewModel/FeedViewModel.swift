//
//  FeedViewModel.swift
//  BeReal
//
//  Created by Volkan Celik on 28/07/2023.
//

import SwiftUI
import Firebase

class FeedViewModel:ObservableObject{
    
    @Published var bereals=[BeReal]()
    @Published var bereal=BeReal(username: "", frontImageUrl: "", backImageUrl: "", userId: "")
    @Published var blur=true
    
    let user:User
    
    init(user:User){
        let date=Date.now
        let formatter=DateFormatter()
        formatter.dateFormat="dd-MM-yy"
        let dateString=formatter.string(from: date)
        self.user=user
        
        Task{
            if let userId=AuthenticationViewModel.shared.currentUser?.id{
                await fetchOwnPost(date: dateString, userId: userId)
            }
            await fetchData(date:dateString)
        }
    }
    
    func fetchData(date:String) async {
        let db=Firestore.firestore()
        do{
            let data=try await db.collection("posts").document(date).collection("bereals").getDocuments()
            bereals=data.documents.compactMap({ try? $0.data(as: BeReal.self)})
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func fetchOwnPost(date:String,userId:String) async {
        let db=Firestore.firestore()
        do{
            let data=try await db.collection("posts").document(date).collection("bereals").document(userId).getDocument()
            bereal=try data.data(as: BeReal.self)
        }
        catch{
            print(error.localizedDescription)
        }
    }
}


