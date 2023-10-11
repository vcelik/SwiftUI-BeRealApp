//
//  Feed.swift
//  BeReal
//
//  Created by Volkan Celik on 22/07/2023.
//

import SwiftUI
import Kingfisher

struct FeedView: View {
    
    @Binding var mainMenu:String
    @State var cameraViewPresented=false
    
    @EnvironmentObject var viewModel:AuthenticationViewModel
    
    @ObservedObject var feedModel:FeedViewModel
    
    init(feedModel:FeedViewModel,menu:Binding<String>){
        self.feedModel=feedModel
        self._mainMenu=menu
    }
    
    var body: some View {
        VStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                ZStack{
                    ScrollView{
                        VStack {
                            
                            if !feedModel.blur{
                                VStack{
                                    VStack{
                                        ZStack{
                                            VStack(alignment:.leading){
                                                KFImage(URL(string: feedModel.bereal.backImageUrl))
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(5)
                                            }
                                            
                                            VStack{
                                                HStack{
                                                    KFImage(URL(string: feedModel.bereal.frontImageUrl))
                                                        .resizable()
                                                        .scaledToFit()
                                                        .border(.black)
                                                        .cornerRadius(2)
                                                        .frame(width:20,height:40)
                                                        .padding(.leading)
                                                    Spacer()
                                                }
                                                .padding(.top,18)
                                                Spacer()
                                            }
                                        }
                                        .frame(width: 100)
                                    }
                                    
                                    VStack{
                                        Text("Add a caption...")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Text("View Comment")
                                            .foregroundColor(.gray)
                                        HStack{
                                            Text("Istanbul 1hr late")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12))
                                            ThreeDots(size: 3, color: .gray)
                                        }
                                    }
                                }
                            }
                            


                            ForEach(feedModel.bereals,id:\.backImageUrl){bereal in
                                FeedCell(bereal: bereal, blur: feedModel.blur, viewModel: FeedCellViewModel(beReal: bereal))
                                    .onAppear{
                                        guard let userId=AuthenticationViewModel.shared.currentUser?.id else {return}
                                        if self.feedModel.blur{
                                            if bereal.userId == userId{
                                                self.feedModel.blur=false
                                            }else{
                                                self.feedModel.blur=true
                                            }
                                        }
                                    }
                            }
                        }
                        .padding(.top,80)
                    }
                    

                    
                    VStack{
                        VStack{
                            HStack{
                                
                                Button {
                                    withAnimation{
                                        mainMenu="left"
                                    }
                                    
                                } label: {
                                    Image(systemName: "person.2.fill")
                                        .foregroundColor(.white)
                                }
                                
                                
                                Spacer()
                                Text("BeReal.")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                                Spacer()
                                
                                Button {
                                    withAnimation{
                                        mainMenu="profile"
                                    }
                                    
                                } label: {
                                    
                                    if let profileImageUrl=viewModel.currentUser?.profileImageUrl{
                                        KFImage(URL(string: profileImageUrl))
                                            .resizable()
                                            .frame(width: 35,height:35)
                                            .cornerRadius(17.5)
                                    }else{
                                        Circle()
                                            .frame(width: 35,height:35)
                                            .cornerRadius(17.5)
                                            .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                            .overlay(
                                                Text(viewModel.currentUser?.name.prefix(1).uppercased() ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size:15))
                                            )
                                    }
                                    
                                    //Image("PHOTO-2020-12-11-15-09-13")
                                    //.resizable()
                                    //.frame(width: 35,height:35)
                                    //.cornerRadius(17.5)
                                }
                                
                                
                            }
                            .padding(.horizontal)
                            HStack{
                                Text("My friends")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                Text("Discovery")
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                        
                        if feedModel.blur{
                            HStack{
                                VStack{
                                    Image(systemName: "circle")
                                        .font(.system(size: 80))
                                    Text("Post a late BeReal")
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                }
                                .foregroundColor(.white)
                                .padding(.bottom,12)
                                .onTapGesture {
                                    cameraViewPresented.toggle()
                                }
                            }
                        }
                        
                    

                    }
                    .shadow(color: .black.opacity(0.2), radius: 2,x: 1,y: 1)
                }
                .onAppear{
                    KingfisherManager.shared.cache.clearMemoryCache()
                }
            }
        }
        .fullScreenCover(isPresented: $cameraViewPresented) {
            
        } content: {
            CameraView(viewModel: CameraViewModel(user: AuthenticationViewModel.shared.currentUser!))
        }


    }
}

