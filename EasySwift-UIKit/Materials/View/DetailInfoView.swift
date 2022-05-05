//
//  DetailInfoView.swift
//  EasySwift-UIKit
//
//  Created by Kirill Drozdov on 05.05.2022.
//

import UIKit


final class DetailInfoView: UIView {

    //MARK: - init(frame)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }

    //MARK: - create collection
     lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
         collection.register(CellCollectionView.self, forCellWithReuseIdentifier: "cell2")
        collection.backgroundColor = UIColor(named: "bg")
        collection.layer.cornerRadius = collection.frame.width / 2

        return collection
    }()

    //MARK: - setups collection()
    private func setupCollectionView(){
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    //MARK: - Other ...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


