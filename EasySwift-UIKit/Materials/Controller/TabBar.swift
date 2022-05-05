//
//  TabBar.swift
//  EasySwift-UIKit
//
//  Created by Kirill Drozdov on 27.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let searchVC      =    MaterialsViewController()
//    let favouriteVC   =   LinksViewController()

    viewControllers = [
      setUpNavigationController(title: "Новости", image: UIImage(systemName: "newspaper"), rootViewController: searchVC)
//      setUpNavigationController(title: "Библиотека", image: UIImage(systemName: "book"), rootViewController: favouriteVC)
    ]

      tabBar.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 0.94)


  }

  private func setUpNavigationController(title: String, image: UIImage?, rootViewController: UIViewController) -> UIViewController {
    let navigationViewController = UINavigationController(rootViewController: rootViewController)
    navigationViewController.tabBarItem.image = image
    navigationViewController.tabBarItem.title = title
    return navigationViewController
  }
}
