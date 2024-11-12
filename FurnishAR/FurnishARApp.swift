//
//  FurnishARApp.swift
//  FurnishAR
//
//  Created by Keith Praveen on 2024-10-15.
//

//import SwiftUI
//import FirebaseCore
//
////class AppDelegate: NSObject, UIApplicationDelegate {
////  func application(_ application: UIApplication,
////                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
////    FirebaseApp.configure()
////    return true
////  }
////}
//
//
//@main
//struct FurnishARApp: App {
////    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    init() {
//            FirebaseApp.configure()
//        }
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

import SwiftUI
import Firebase

@main
struct FurnishARApp: App {
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
