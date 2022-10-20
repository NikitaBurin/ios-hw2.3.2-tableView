//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Никита Бурин on 07.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let feedVC = UINavigationController(rootViewController: FeedViewController())
    let profileVC = UINavigationController(rootViewController: ProfileViewController())
    let logInVC = UINavigationController(rootViewController: LogInViewController())
    let tabBarC = UITabBarController()
   
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
       
        tabBarC.viewControllers = [profileVC, feedVC, logInVC]
        tabBarC.tabBar.backgroundColor = .white
        
        window.rootViewController = tabBarC
        window.makeKeyAndVisible()
    }

}

