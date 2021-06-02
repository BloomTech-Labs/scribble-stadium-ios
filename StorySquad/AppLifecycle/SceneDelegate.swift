//
//  SceneDelegate.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 6/17/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
import OktaAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = DrawVC()
        self.window = window
        window.makeKeyAndVisible()
    }
    
/// Note from Cora: this function was in the Labs starter project to initiate login immediately upon launch
/// Implement the Okta login sequence from a Sign In button instead of here
//    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//
//        guard let context = URLContexts.first else { return }
//
//        let url = context.url
//        ProfileController.shared.oktaAuth.receiveCredentials(fromCallbackURL: url) { (result) in
//
//            let notificationName: Notification.Name
//            do {
//                try result.get()
//                guard (try? ProfileController.shared.oktaAuth.credentialsIfAvailable()) != nil else { return }
//                notificationName = .oktaAuthenticationSuccessful
//            } catch {
//                notificationName = .oktaAuthenticationFailed
//            }
//
//            DispatchQueue.main.async {
//                NotificationCenter.default.post(name: notificationName, object: nil)
//            }
//        }
//    }
}

