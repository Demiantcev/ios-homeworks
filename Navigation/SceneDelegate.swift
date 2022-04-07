//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 13.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBar = UITabBarController()
        
        
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = tabBar
        self.window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController(rootViewController: FeedViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "eye.circle.fill"), tag: 0)
        
        let navigationController2 = UINavigationController(rootViewController: LogInViewController())
        navigationController2.tabBarItem = UITabBarItem (title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)
        navigationController2.navigationBar.isHidden = true
        
        let navigationController3 = UINavigationController(rootViewController: GestureView())
        navigationController3.tabBarItem = UITabBarItem(title: "Жесты", image: UIImage(systemName: "hand.draw"), tag: 3)
        
        tabBar.setViewControllers([navigationController, navigationController2, navigationController3], animated: false)
        
        let navigationController4 = UINavigationController(rootViewController: PhotosViewController())
        navigationController4.navigationBar.isHidden = false
        
        
        
        }
        
        
        

        
        
        
        

        

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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




