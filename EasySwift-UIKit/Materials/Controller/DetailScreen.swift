//
//  DetailScreen.swift
//  EasySwift-UIKit
//
//  Created by Kirill Drozdov on 26.04.2022.
//

import UIKit

final class DetaiInformation: UIViewController {
    
    // данные для collection
    var testText = ["RoadMap", "Слитые курсы", "Создатель сообщества", "Coffe & Code"]
    
    //MARK: - !!!!!!!!!
    private lazy var mainView = DetailInfoView()
    // ---------------
    
    //MARK: - loadView()
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    //MARK: - viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        title = "Наши ссылки" // !!!
    }
}

//MARK: - CollectionView
extension DetaiInformation: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CellCollectionView
        myCell.nameLabel.text = testText[indexPath.row]
        myCell.destinationImage.image = UIImage(systemName: "arrow.up.right")
        myCell.destinationImage.tintColor = UIColor(red: 113/255, green: 116/255 , blue: 122/255, alpha: 1)
        myCell.layer.cornerRadius = 12.0
        myCell.backgroundColor = UIColor(red: 0.788, green: 0.8, blue: 0.82, alpha: 0.24)
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize{
        return CGSize(width: view.frame.width - 33,  height: view.frame.height / 17 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:20, left: 16, bottom: 10, right: 16)
    }
    
}

