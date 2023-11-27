//
//  pokemon_tcg_inventoryApp.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/19/23.
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct pokemon_tcg_inventoryApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
