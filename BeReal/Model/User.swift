//
//  User.swift
//  BeReal
//
//  Created by Volkan Celik on 27/07/2023.
//

import Firebase
import FirebaseFirestoreSwift

struct User:Decodable,Identifiable{
    @DocumentID var id:String?
    var username:String?
    var profileImageUrl:String?
    var name:String
    var date:String
    var bio:String?
    var location:String?
    var phone:String
    
    var isCurrentUser:Bool{
        return AuthenticationViewModel.shared.userSession?.uid == id
    }
    
    
    
     
}
