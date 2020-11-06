//
//  SceneDelegate.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = createMainTabBarController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

        private func createMainTabBarController() -> UITabBarController {
            let firstvc = YogaController()
            let secondvc = YogaFlowController()
            let thirdvc  = PoseIndexController()
    
            firstvc.tabBarItem = UITabBarItem(title: "Yoga", image: UIImage(systemName: "1.circle"), tag: 0)
            secondvc.tabBarItem = UITabBarItem(title: "Flow", image: UIImage(systemName: "flowchart"), tag: 1)
            thirdvc.tabBarItem = UITabBarItem(title: "Poses", image: UIImage(systemName: "doc.plaintext"), tag: 2)
            let tabVC = UITabBarController()
    
            tabVC.setViewControllers([firstvc,secondvc,thirdvc], animated: false)
            return tabVC
        }
}

