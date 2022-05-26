//
//  BottomCellModel.swift
//  RelaxApp
//
//  Created by Vitaliy Petrovskiy on 20.04.22.
//

import Foundation
import UIKit

struct CellModel {
    var name: String
    var date: String
    var time: String
    var image: UIImage
 
    static func fetchBottomCells() -> [CellModel] {
        let firstCell = CellModel(name: "COW - Copy on write", date: "28.04.2022", time: "16:40", image: UIImage(named: "image3")!)
        let tCell = CellModel(name: "Name1", date: "28.04.2022", time: "16:40", image: UIImage(named: "image2")!)
        let ttCell = CellModel(name: "Search Test", date: "28.04.2022", time: "16:40", image: UIImage(named: "image1")!)
        return [firstCell, tCell, ttCell]
    }
    
}
