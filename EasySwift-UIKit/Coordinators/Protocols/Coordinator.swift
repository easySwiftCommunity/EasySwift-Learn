//
//  Coordinator.swift
//  EasySwift-UIKit
//
//  Created by Kirill Drozdov on 14.08.2022.
//

import UIKit
import Foundation

protocol Coordinator {
    var navigationController: UINavigationController {get set}

    func start() // запускает представление
}
