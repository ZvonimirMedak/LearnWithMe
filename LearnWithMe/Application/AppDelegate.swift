//
//  AppDelegate.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 05.12.2021..
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        let initialController = UINavigationController()
        initialController.isNavigationBarHidden = true
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else {
            return false
        }
        initialController.setRootWireframe(HomeWireframe())
        window.rootViewController = initialController
        window.makeKeyAndVisible()
        return true
    }
}

