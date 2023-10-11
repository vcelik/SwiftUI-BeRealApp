//
//  EnterNameView.swift
//  BeReal
//
//  Created by Volkan Celik on 26/07/2023.
//

import SwiftUI

struct EnterNameView: View {
    
    @Binding var name:String
    @State var buttonActive=false
    
    @Binding var nameButtonClicked:Bool
    
    @EnvironmentObject var viewModel:AuthenticationViewModel
    
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        Text("BeReal")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack {
                    VStack(alignment:.center,spacing: 8){
                        Text("Let's get started, whats's your name?")
                            .fontWeight(.heavy)
                            .font(.system(size: 16))
                        Text(name.isEmpty ? "Your Name" : "")
                            .foregroundColor(name.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width:210)
                            .overlay(
                                TextField("", text: $name)
                                    .font(.system(size: 40,weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            )
                        Spacer()
                    }
                    .foregroundColor(.white)
                }
                .padding(.top,50)
                
                VStack{
                    Spacer()
                    Button {
                        if buttonActive{
                            nameButtonClicked=true
                        }else{
                            buttonActive=true
                        }
                    } label: {
                        WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                            .onChange(of: name) { newValue in
                                if !newValue.isEmpty{
                                    buttonActive=true
                                }else if newValue.isEmpty{
                                    buttonActive=false
                                }
                            }
                    }
                }
            }
        }
    }
}

struct EnterNameView_Previews: PreviewProvider {
    static var previews: some View {
        EnterNameView(name:.constant("Volkan"), nameButtonClicked: .constant(true))
    }
}
