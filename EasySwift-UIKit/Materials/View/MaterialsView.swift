//
//  MaterialsView.swift
//  EasySwift-UIKit
//
//  Created by Андрей Лапин on 25.04.2022.
//

import UIKit

final class MaterialsView: UIView {

    //MARK: - init(frame)
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupOurMaterialsTable()
        setupMainMaterialsLabel()
        setupCollectionView()
        setupView()
    }

    private let ourMaterialsHeightRow: CGFloat = 44
    private let identifier: String = "cell"


    //MARK: - create table
     lazy var ourMaterialsTable: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false

        return table
    }()

    //MARK: - create label
     lazy var mainMaterialsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Основные материалы по Swift:"
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5

        return label
    }()

    //MARK: - create collection
     lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CellCollectionView.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = UIColor(named: "bg")
        collection.layer.cornerRadius = collection.frame.width / 2

        return collection
    }()

    //MARK: - setups table()
    private func setupOurMaterialsTable() {
        addSubview(ourMaterialsTable)

        ourMaterialsTable.backgroundColor = UIColor(named: "bg")

        NSLayoutConstraint.activate([
            ourMaterialsTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            ourMaterialsTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            ourMaterialsTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            ourMaterialsTable.heightAnchor.constraint(equalToConstant: ourMaterialsHeightRow * CGFloat(OurMaterials.allCases.count))
        ])
    }

    //MARK: - setups label()
    private func setupMainMaterialsLabel(){
        addSubview(mainMaterialsLabel)

        NSLayoutConstraint.activate([
            mainMaterialsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainMaterialsLabel.topAnchor.constraint(equalTo: ourMaterialsTable.bottomAnchor,constant: 32),
            mainMaterialsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainMaterialsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    //MARK: - setups collection()
    private func setupCollectionView(){
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: mainMaterialsLabel.bottomAnchor,constant: 32),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    //MARK: - setupView()
    private func setupView() {
        backgroundColor = UIColor(named: "bg")
    }

    //MARK: - other ...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
