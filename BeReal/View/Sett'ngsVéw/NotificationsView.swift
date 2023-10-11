//
//  NotificationsView.swift
//  BeReal
//
//  Created by Volkan Celik on 25/07/2023.
//

import SwiftUI

struct NotificationsView: View {
    
    @State var mentions=false
    @State var comments=false
    @State var friendRequests=false
    @State var lateBeReal=false
    @State var realMojis=false
    
    @State var buttonActive=false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    ZStack{
                        Text("Notifications")
                            .fontWeight(.semibold)
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .font(.system(size: 20))
                            }


                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .foregroundColor(.white)
                
                VStack{
                    VStack{
                        HStack{
                            Text("On BeReal, you're in control of your push notifications.")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        
                        HStack{
                            Text("You can choose the type of notifications you want to receive.")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    
                    VStack(spacing:14){
                        VStack{
                            NotificationsButtonView(icon: "person.crop.square.filled.and.at.rectangle", text: "Mentions", toggle: $mentions)
                            HStack{
                                Text("dilaysila mentioned you on seanlund's BeReal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            NotificationsButtonView(icon: "bubble.left.fill", text: "Comments", toggle: $comments)
                            HStack{
                                Text("ercimiyal commented on your BeReal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            NotificationsButtonView(icon: "person.2.fill", text: "Friend requests", toggle: $friendRequests)
                            HStack{
                                Text("ercimmival just sent you a friend request.")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            NotificationsButtonView(icon: "timer", text: "Late BeReal", toggle: $lateBeReal)
                            HStack{
                                Text("zeymustu just posted late")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            NotificationsButtonView(icon: "face.smiling.fill", text: "Realmojis", toggle: $realMojis)
                            HStack{
                                Text("ogulcan just reacted to your BeReal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                    }
                    .padding(.top,8)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top,50)
                
                VStack{
                    Spacer()
                    WhiteButtonView(buttonActive: $buttonActive, text: "Save")
                        .onChange(of: mentions || comments || friendRequests || lateBeReal || realMojis) { _ in
                            buttonActive=true
                        }
                }
                

            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
