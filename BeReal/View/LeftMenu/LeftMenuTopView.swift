//
//  LeftMenuTopView.swift
//  BeReal
//
//  Created by Volkan Celik on 23/07/2023.
//

import SwiftUI

struct LeftMenuTopView: View {
    
    @State var text=""
    @State var isEditing=false
    
    @Binding var mainMenu:String
    
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Spacer()
                    
                    Button {
                        withAnimation{
                            mainMenu="feed"
                        }

                    } label: {
                        Image(systemName: "arrow.forward")
                            .foregroundColor(.white)
                    }


                }
                Text("BeReal")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
            }
            
            SearchBar(text: $text, isEditing: $isEditing)
            Spacer()
        }
    }
}

struct LeftMenuTopView_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenuTopView(mainMenu: .constant("left"))
    }
}
