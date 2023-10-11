//
//  HelpView.swift
//  BeReal
//
//  Created by Volkan Celik on 25/07/2023.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    ZStack{
                        Text("Help")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }


                            Spacer()
                        }
                    }
                    Spacer()
                }
                
                VStack{
                    VStack(spacing:16){
                        NavigationLink {
                            ContactUsView().navigationBarBackButtonHidden()
                        } label: {
                            ChevronButtonView(icon: "envelope", text: "Contact us")
                        }

                        ChevronButtonView(icon: "questionmark.circle", text: "Help Center")
                        Spacer()
                    }
                    .padding(.top,50)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
