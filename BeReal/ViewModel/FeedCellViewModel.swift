//
//  FeedCellViewModel.swift
//  BeReal
//
//  Created by Volkan Celik on 28/07/2023.
//

import SwiftUI
import Firebase

class FeedCellViewModel:ObservableObject{
    
    @Published var beReal:BeReal
    
    init(beReal:BeReal){
        self.beReal=beReal
        fetchBeRealUser()
    }
    
    func fetchBeRealUser(){
        Firestore.firestore().collection("users").document(beReal.userId).getDocument { snap, err in
            if let err=err{
                print(err.localizedDescription)
                return
            }
            
            self.beReal.user=try? snap?.data(as: User.self)
            
        }
    }
}


