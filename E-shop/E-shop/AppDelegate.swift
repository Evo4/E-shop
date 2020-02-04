//
//  AppDelegate.swift
//  E-shop
//
//  Created by Vyacheslav on 29.01.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var user: User?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        user = Service.shared.deserializeUser()
        print("app delegate user check:", user!)
        if user != nil {
            Service.shared.loginAccount(username: user!.username, password: user!.password) { (reply) in
                switch reply {
                case .success():
                    DispatchQueue.main.async { [weak self] in
                        let vc = MainVC()
                        let navController = UINavigationController(rootViewController: vc)
                        self?.window?.rootViewController = navController
                    }
                    break
                case .failure( _):
                    let vc = LoginVC()
                    self.window?.rootViewController = vc
                    break
                }
            }
        } else {
            let vc = LoginVC()
            window?.rootViewController = vc
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

