//
//  pxiosdemoApp.swift
//  pxiosdemo
//
//

import SwiftUI

@main
struct pxiosdemoApp: App {
    // Register AppDelegate for UIApplicationDelegateAdaptor
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
