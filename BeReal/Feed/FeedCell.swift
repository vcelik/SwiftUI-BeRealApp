//
//  Deneme.swift
//  BeReal
//
//  Created by Volkan Celik on 22/07/2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    var bereal:BeReal
    var blur:Bool
    
    @ObservedObject var viewModel:FeedCellViewModel
    
    init(bereal: BeReal, blur: Bool,viewModel:FeedCellViewModel) {
        self.bereal = bereal
        self.blur = blur
        self.viewModel=viewModel
    }
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(alignment:.leading){
                
                HStack{
                    if let userUrl=viewModel.beReal.user?.profileImageUrl{
                        KFImage(URL(string: userUrl))
                            .resizable()
                            .frame(width:40,height:40)
                            .cornerRadius(20)
                    }else{
                        Circle()
                            .frame(width:40,height:40)
                            .cornerRadius(20)
                            .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                            .overlay(
                                Text(viewModel.beReal.username.prefix(1).uppercased())
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            )
                    }
                    
                    VStack(alignment:.leading){
                        
                        if let user=viewModel.beReal.user{
                            Text(user.name)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                        }

                        Text("Istanbul 7 hr late")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                    Spacer()
                    ThreeDots(size: 4, color: .gray)
                    
                }.padding(.horizontal)
                
                //IMAGE
                VStack(alignment:.leading){
                    ZStack{
                        ZStack{
                            VStack{
                                Spacer()
                                HStack{
                                    Spacer()
                                    VStack{
                                        Image(systemName: "bubble.left.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 25))
                                            .shadow(color: .black, radius: 3,x: 1,y: 1)
                                        
                                        Image(systemName: "face.smiling.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 25))
                                            .shadow(color: .black, radius: 3,x: 1,y: 1)
                                            .padding(.top,15)
                                    }
                                    .padding(.trailing)
                                    .padding(.bottom,50)

                                }
                            }
                            .zIndex(1)
                            
                            
                            VStack(alignment:.leading){
                                
                                KFImage(URL(string: bereal.backImageUrl))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:UIScreen.main.bounds.width)
                                    .cornerRadius(20)
                            }
                            
                            GeometryReader{g in
                                VStack{
                                    HStack{
                                        KFImage(URL(string: bereal.frontImageUrl))
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(8)
                                            .frame(height: 160)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.black,lineWidth:3)
                                            )
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    .padding(.top,18)
                                    Spacer()
                                }
                            }
                        }
                        .blur(radius: blur ? 8 : 0)
                        
                        if blur{
                            VStack{
                                Image(systemName: "eye.slash.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                Text("Post to view")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .padding(.top,4)
                                Text("To view your friends BeRea, share yours with them.")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                    .padding(.top,-4)
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(.white)
                                    .frame(width:180,height: 40)
                                    .overlay(
                                        Text("Post a Late BeReal")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12))
                                    )
                                    .padding(.top,6)
                            }
                        }
                    }
                    
                    Text(blur ? "" : "Add a comment...")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .padding(.leading,4)
                }
                

            }
            .frame(width:UIScreen.main.bounds.width,height: 600)
        }
    }
}

