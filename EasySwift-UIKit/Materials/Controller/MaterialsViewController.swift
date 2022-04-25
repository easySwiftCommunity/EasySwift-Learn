//
//  ViewController.swift
//  EasySwift-UIKit
//
//  Created by Андрей Лапин on 24.04.2022.
//

import UIKit


final class MaterialsViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
                        
        setupNavController()
    }
    
    override func loadView() {
        super.loadView()
        view = MaterialsView()
        
    }
       

    private func setupNavController() {
        title = "Материалы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 40, weight: .bold)
        ]

    }
}



