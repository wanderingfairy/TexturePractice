//
//  AppDelegate.swift
//  TexturePractice
//
//  Created by 정의석 on 2020/11/28.
//

import UIKit
import Then
import AsyncDisplayKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    ASDisplayNode.shouldShowRangeDebugOverlay = false
    
    let UIKitNavControllerMain = UINavigationController(rootViewController: MainViewController())
    UIKitNavControllerMain.tabBarItem = .init(title: "Main", image: nil, selectedImage: nil)
    
    let UIKitNavControllerSecond = UINavigationController(rootViewController: SecondViewController())
    UIKitNavControllerSecond.tabBarItem = .init(title: "Second", image: nil, selectedImage: nil)
    let tabBarController = UITabBarController()
    
    let UIKitNavControllerThird = UINavigationController(rootViewController: ThirdViewController())
    UIKitNavControllerThird.tabBarItem = .init(title: "Third", image: nil, selectedImage: nil)
    
    tabBarController.viewControllers = [UIKitNavControllerMain, UIKitNavControllerSecond, UIKitNavControllerThird]
    tabBarController.selectedIndex = 2
    
    window = UIWindow()
    window?.backgroundColor = .white
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
    return true
  }
}

