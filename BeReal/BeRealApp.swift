//
//  BeRealApp.swift
//  BeReal
//
//  Created by Volkan Celik on 22/07/2023.
//

import SwiftUI
import FirebaseCore
import Firebase
import UIKit

@main
struct BeRealApp: App {
    
    
    
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            //CameraView(viewModel: CameraViewModel(user: AuthenticationViewModel.shared.currentUser ?? User(name: "Volkan", date: "")))
            MainView()
                .environmentObject(AuthenticationViewModel.shared)
        }
    }
}

class AppDelegate:NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?=nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async->UIBackgroundFetchResult {
        return .noData
    }

}
