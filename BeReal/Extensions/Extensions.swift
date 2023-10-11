//
//  Extensions.swift
//  BeReal
//
//  Created by Volkan Celik on 23/07/2023.
//

import SwiftUI

extension View{
    func placeholder<Content:View>(when shouldShow:Bool,alignment:Alignment = .leading,@ViewBuilder placeholder:()->Content)->some View{
        ZStack(alignment:alignment){
            placeholder().opacity(shouldShow ? 1:0)
        }
    }
}

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
