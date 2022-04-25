//
//  MaterialsView.swift
//  EasySwift-UIKit
//
//  Created by Андрей Лапин on 25.04.2022.
//

import UIKit

class MaterialsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupOurMaterialsTable()
        setupMainMaterialsLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let ourMaterialsHeightRow: CGFloat = 44
    
    
    //MARK: - UIView
    private lazy var ourMaterialsTable: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        return table
    }()
    
    private lazy var mainMaterialsLabel: UILabel = {
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
    
    
    //MARK: - setups()
    
    private func setupOurMaterialsTable() {        
        addSubview(ourMaterialsTable)
        ourMaterialsTable.delegate = self
        ourMaterialsTable.dataSource = self
        
        ourMaterialsTable.backgroundColor = UIColor(named: "bg")
        
        NSLayoutConstraint.activate([
            ourMaterialsTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            ourMaterialsTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            ourMaterialsTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            ourMaterialsTable.heightAnchor.constraint(equalToConstant: ourMaterialsHeightRow * CGFloat(OurMaterials.allCases.count))
        ])                
    }
    
    private func setupMainMaterialsLabel(){
            addSubview(mainMaterialsLabel)

            NSLayoutConstraint.activate([
                mainMaterialsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                mainMaterialsLabel.topAnchor.constraint(equalTo: ourMaterialsTable.bottomAnchor,constant: 32),
                mainMaterialsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                mainMaterialsLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    
    private func setupView() {
        backgroundColor = UIColor(named: "bg")
    }
    
}

extension MaterialsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        OurMaterials.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ourMaterialsHeightRow
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = UITableViewCell()
        
        cell.textLabel?.text = OurMaterials.allCases[index].rowTitle
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}
