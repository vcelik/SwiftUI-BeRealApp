//
//  EnterPhoneNumberView.swift
//  BeReal
//
//  Created by Volkan Celik on 26/07/2023.
//

import SwiftUI

struct EnterPhoneNumberView: View {
    

    @State var showCountryList=false
    @State var buttonActive=false
    
    @Binding var phoneNumberButtonClicked:Bool
    
    @EnvironmentObject var viewModel:AuthenticationViewModel
    
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        Text("BeReal.")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack(alignment:.center,spacing: 8){
                    Text("Create your account using your phone number")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))
                    HStack {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 1)
                            .frame(width:75,height: 45)
                            .foregroundColor(.gray)
                            .overlay(
                                Text("\(viewModel.country.flag(country: viewModel.country.isoCode))")
                                +
                                Text("+\(viewModel.country.phoneCode)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                            )
                            .onTapGesture {
                                showCountryList.toggle()
                        }
                        
                        Text("Your Phone")
                            .foregroundColor(viewModel.phoneNumber.isEmpty ?Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 220)
                            .overlay(
                                TextField("", text: $viewModel.phoneNumber)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40,weight: .heavy))
                            )
                    }
                    .padding(.leading,UIScreen.main.bounds.width*0.05)
                    Spacer()
                }
                .padding(.top,50)
                
                VStack{
                    Spacer()
                    Text("By tapping \"Continue\", you agree to our Privacy Policy and Terms of Service.")
                        .foregroundColor(Color(red: 70/255, green: 70/255, blue: 73/255))
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                    Button {
                        Task{
                            await viewModel.sendOtp()
                        }

                    } label: {
                        WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                            .onChange(of: viewModel.phoneNumber) { newValue in
                                if !newValue.isEmpty{
                                    buttonActive=true
                                }else if newValue.isEmpty{
                                    buttonActive=false
                                }
                            }
                    }
                    .disabled(viewModel.phoneNumber.isEmpty ? true : false)

                }
            }
        }
        .sheet(isPresented: $showCountryList) {
            SelectCountryView(countryChosen: $viewModel.country)
        }
        .overlay{
            ProgressView()
                .opacity(viewModel.isLoading ? 1 : 0)
        }
        .background{
            NavigationLink(tag: "VERIFICATION", selection: $viewModel.navigationTag, destination: {
                EnterCodeView()
                    .environmentObject(viewModel)
            }, label: {})
        }
        .environment(\.colorScheme, .dark)
    }
}

struct EnterPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        EnterPhoneNumberView(phoneNumberButtonClicked: .constant(true))
    }
}
