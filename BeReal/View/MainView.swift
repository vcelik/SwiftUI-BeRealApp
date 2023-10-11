//
//  MainView.swift
//  BeReal
//
//  Created by Volkan Celik on 27/07/2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel:AuthenticationViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession == nil{
                MainAuthenticationView()
            }else{
                ContentView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AuthenticationViewModel())
    }
}
