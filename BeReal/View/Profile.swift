//
//  Profile.swift
//  BeReal
//
//  Created by Volkan Celik on 22/07/2023.
//

import SwiftUI
import Kingfisher

struct Profile: View {
    @Binding var mainMenu:String
    @EnvironmentObject var viewModel:AuthenticationViewModel
    var body: some View {
        VStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Button {
                            withAnimation{
                                mainMenu="feed"
                            }

                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }


                        Spacer()
                        Text("Profile")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        Spacer()
                        NavigationLink {
                            SettingsView().navigationBarBackButtonHidden()
                        } label: {
                            ThreeDots(size: 4, color: .white)
                        }

                    }
                    .padding(.horizontal)
                    Spacer()
                }
                
                VStack{
                    
                    if let profileImageUrl=viewModel.currentUser?.profileImageUrl{
                        KFImage(URL(string: profileImageUrl))
                            .resizable()
                            .frame(width:130,height:130)
                            .cornerRadius(75)
                    }else{
                        Circle()
                            .frame(width:130,height:130)
                            .cornerRadius(75)
                            .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                            .overlay(
                                Text(viewModel.currentUser?.name.prefix(1).uppercased() ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 55))
                            )
                    }

                    Text(viewModel.currentUser?.name ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Text(viewModel.currentUser?.username ?? "")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    HStack{
                        Text("Your Memories")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                        Spacer()
                        HStack(spacing:4){
                            Image(systemName: "lock.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 10))
                            Text("Only visible to you")
                                .foregroundColor(.gray)
                                .font(.system(size: 10))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top,4)
                    
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(.white)
                                .opacity(0.07)
                                .frame(height: 230)
                            VStack{
                                HStack{
                                    Text("Last 14 days")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16))
                                        .padding(.top,8)
                                    Spacer()
                                }
                                .padding(.leading)
                                
                                VStack{
                                    HStack(spacing:4){
                                        ForEach(1..<8){x in
                                            MemoryView(day: x)
                                        }
                                    }
                                    
                                    HStack(spacing:4){
                                        ForEach(1..<8){x in
                                            MemoryView(day: x+7)
                                        }
                                    }
                                    .padding(.top,-4)
                                }
                                .padding(.top,-4)
                                
                                Text("View all my Memories")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 13))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8).stroke(.gray,lineWidth: 2)
                                            .frame(width:175,height:20)
                                            .opacity(0.5)
                                    )
                                    .padding(.top,4)
                            }
                            .padding(.top,-15)
                        }
                    }
                    
                    Text("📎BeRe.al/volkan")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                        .padding(.top,8)
                    Spacer()
                }
                .padding(.top,35)
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(mainMenu: .constant("profile"))
    }
}
