//
//  AppDelegate.swift
//  TexturePractice
//
//  Created by 정의석 on 2020/11/28.
//

import UIKit
import Then


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let UIKitNavController = UINavigationController(rootViewController: MainViewController())
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [UIKitNavController]
    tabBarController.selectedIndex = 0
    
    window = UIWindow()
    window?.backgroundColor = .white
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
    return true
  }
  
  
}

