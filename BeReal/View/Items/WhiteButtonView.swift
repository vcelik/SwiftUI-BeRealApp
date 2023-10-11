//
//  WhiteButtonView.swift
//  BeReal
//
//  Created by Volkan Celik on 26/07/2023.
//

import SwiftUI

struct WhiteButtonView: View {
    
    @Binding var buttonActive:Bool
    var text:String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width*0.9,height: 45)
                .foregroundColor(buttonActive ? Color(red: 250/255, green: 250/255, blue: 250/255) : Color(red: 86/225, green: 86/225, blue: 88/225))
            
            HStack{
                Spacer()
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.horizontal,UIScreen.main.bounds.width*0.1)
            .frame(height: 30)
        }
    }
}

struct WhiteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteButtonView(buttonActive: .constant(false), text: "Save")
    }
}
