//
//  OurMaterials.swift
//  EasySwift-UIKit
//
//  Created by Андрей Лапин on 25.04.2022.
//

import Foundation


enum OurMaterials: Int, CaseIterable {
    case reports, interview, links
    
    var rowTitle: String {
        switch self {
        case .reports: return "Доклады"
        case .interview: return "Собеседования"
        case .links: return "Наши ссылки"
        }
    }
}
