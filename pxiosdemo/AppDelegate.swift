//
//  AppDelegate.swift
//  pxiosdemo
//
//

import Foundation
import UIKit
import SdkPushExpress

class AppDelegate: NSObject, UIApplicationDelegate {
    private let PUSHEXPRESS_APP_ID = "22155-1157" // set YOUR OWN ID from Push.Express account page
    private var myOwnDatabaseExternalId = ""      // you can just leave it empty in most cases
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize SDK with PushExpress Application ID
        try! PushExpressManager.shared.initialize(appId: PUSHEXPRESS_APP_ID)
        
        // DO NOT SET UNLESS YOU ARE 100% SURE WHAT THAT IS!!!
        /*
        myOwnDatabaseExternalId = "my_external_user_id:321"
        PushExpressManager.shared.tags["audiences"] = "my_aud_123"
        PushExpressManager.shared.tags["webmaster"] = "webmaster_name"
        PushExpressManager.shared.tags["ad_id"] = "advertising_id"
        PushExpressManager.shared.tags["my_custom_tag"] = "my_custom_value"
        */
        
        // You can also disable notifications while app is on screen (foreground)
        /*PushExpressManager.shared.foregroundNotifications = false*/
        
        // Activate SDK (starting all network activities)
        try! PushExpressManager.shared.activate(extId: myOwnDatabaseExternalId)
        print("externalId: '\(PushExpressManager.shared.externalId)'")
        
        // If and only if you want to use same app for multiple users
        // call .deactivate() first, than activate() with new extId
        // Better talk with our support, we always ready to help =)
        /*try! PushExpressManager.shared.deactivate()*/
        
        if !PushExpressManager.shared.notificationsPermissionGranted {
            // show your custom message like "Go to iOS Settings and enable notifications"
        }
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        PushExpressManager.shared.transportToken = tokenParts.joined()
    }
}
