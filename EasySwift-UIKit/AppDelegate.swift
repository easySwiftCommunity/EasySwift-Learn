//
//  AppDelegate.swift
//  EasySwift-UIKit
//
//  Created by Андрей Лапин on 24.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//TODO: - ДОПИЛИТЬ ПРИЛУ
    // - ДИЗАЙН ВЗЯТЬ ИЗ ФИГМЫ (https://www.figma.com/file/Rj7pECH4t2868iJjvi5Irw/Untitled?node-id=0%3A1)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

