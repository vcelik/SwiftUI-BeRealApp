//
//  Settings.swift
//  BeReal
//
//  Created by Volkan Celik on 23/07/2023.
//

import SwiftUI
import Kingfisher

struct SettingsView: View {
    
    @State var width=UIScreen.main.bounds.width
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel:AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Color.black.ignoresSafeArea()
                    VStack{
                        ZStack{
                            Text("Settings")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            HStack{
                                Button {
                                    
                                } label: {
                                    Image(systemName: "arrow.backward")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }


                                Spacer()
                            }
                        }.padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    VStack{
                        
                        NavigationLink {
                            EditProfileView(currentUser: viewModel.currentUser ?? User(name: "nil", date: "", phone: "")).navigationBarBackButtonHidden()
                        } label: {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width:UIScreen.main.bounds.width * 0.9,height: 90)
                                .foregroundColor(.white)
                                .opacity(0.07)
                                .overlay(
                                    HStack {
                                        if let profileImageUrl=viewModel.currentUser?.profileImageUrl{
                                            KFImage(URL(string: profileImageUrl))
                                                .resizable()
                                                .frame(width:60,height: 60)
                                                .cornerRadius(30)
                                        }else{
                                            Circle()
                                                .frame(width:60,height: 60)
                                                .cornerRadius(30)
                                                .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                                .overlay(
                                                    Text(viewModel.currentUser?.name.prefix(1).uppercased() ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 25))
                                                )
                                        }

                                        VStack(alignment:.leading){
                                            Text(viewModel.currentUser?.name ?? "")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 18))
                                            Text(viewModel.currentUser?.username ?? "")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 14))
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }.padding(.horizontal,18)
                                )
                        }


                        
                        VStack(spacing:6){
                            HStack{
                                Text("FEATURES")
                                    .foregroundColor(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal,UIScreen.main.bounds.width*0.05)
                                Spacer()
                            }
                            
                            NavigationLink {
                                MemoriesView().navigationBarBackButtonHidden()
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: width*0.9,height: 45)
                                        .foregroundColor(.white)
                                        .opacity(0.07)
                                    HStack{
                                        Image(systemName: "calendar")
                                            .foregroundColor(.white)
                                        Text("Memories")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14))
                                    }
                                    .padding(.horizontal,width*0.1)
                                    .frame(height: 30)
                                }
                            }

                            

                        }
                        .padding(.top,12)
                        
                        VStack(spacing:6){
                            HStack{
                                Text("SETTINGS")
                                    .foregroundColor(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal,UIScreen.main.bounds.width*0.05)
                                Spacer()
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 14)
                                    .frame(width:width*0.9,height: 145)
                                    .foregroundColor(.white)
                                    .opacity(0.07)
                                VStack{
                                    
                                    NavigationLink {
                                        NotificationsView().navigationBarBackButtonHidden()
                                    } label: {
                                        HStack{
                                            Image(systemName: "square.and.pencil")
                                                .foregroundColor(.white)
                                            Text("Notifications")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal,width*0.1)
                                        .frame(height: 30)
                                    }


                                    
                                    Rectangle()
                                        .frame(width:width*0.9,height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                    
                                    NavigationLink {
                                        TimeZoneView().navigationBarBackButtonHidden()
                                    } label: {
                                        HStack{
                                            Image(systemName: "globe.europe.africa.fill")
                                                .foregroundColor(.white)
                                            Text("Time Zone: Europe")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal,width*0.1)
                                        .frame(height: 30)
                                    }

                                    Rectangle()
                                        .frame(width:width*0.9,height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                    
                                    NavigationLink {
                                        OtherView().navigationBarBackButtonHidden()
                                    } label: {
                                        HStack{
                                            Image(systemName: "hammer.circle")
                                                .foregroundColor(.white)
                                            Text("Other")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal,width*0.1)
                                        .frame(height: 30)
                                    }
                                }
                            }
                        }
                        .padding(.top,12)
                        
                        VStack(spacing:6){
                            HStack{
                                Text("ABOUT")
                                    .foregroundColor(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal,UIScreen.main.bounds.width*0.05)
                                Spacer()
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 14)
                                    .frame(width:width*0.9,height: 190)
                                    .foregroundColor(.white)
                                    .opacity(0.07)
                                VStack{
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack{
                                            Image(systemName: "square.and.arrow.up")
                                                .foregroundColor(.white)
                                            Text("Share BeReal")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal,width*0.1)
                                        .frame(height: 30)
                                    }


                                    
                                    Rectangle()
                                        .frame(width:width*0.9,height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack{
                                            Image(systemName: "star")
                                                .foregroundColor(.white)
                                            Text("Rate BeReal")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal,width*0.1)
                                        .frame(height: 30)
                                    }

                                    Rectangle()
                                        .frame(width:width*0.9,height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                    
                                    NavigationLink {
                                        HelpView().navigationBarBackButtonHidden()
                                    } label: {
                                        HStack{
                                            Image(systemName: "lifepreserver")
                                                .foregroundColor(.white)
                                            Text("Help")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal,width*0.1)
                                        .frame(height: 30)
                                    }
                                    
                                    Rectangle()
                                        .frame(width:width*0.9,height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack{
                                            Image(systemName: "info.circle")
                                                .foregroundColor(.white)
                                            Text("About")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal,width*0.1)
                                        .frame(height: 30)
                                    }
                                    
                                    
                                }
                            }
                        }
                        .padding(.top,12)
                        
                        //LOGOUT
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width:width*0.9,height: 45)
                                .foregroundColor(.white)
                                .opacity(0.07)
                            HStack{
                                Spacer()
                                
                                Button {
                                    AuthenticationViewModel.shared.signOut()
                                } label: {
                                    Text("Log Out")
                                        .foregroundColor(.red)
                                }


                                Spacer()
                            }
                            .padding(.horizontal,width*0.1)
                            .frame(height: 30)
                        }
                        .padding(.top,12)
                        
                        Text("Version 0.27.0 - Production")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                            .padding(.top,12)
                        
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
