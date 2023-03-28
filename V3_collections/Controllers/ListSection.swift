//
//  ListSection.swift
//  V3_collections
//
//  Created by Alex on 28.03.2023.
//

import UIKit
import Foundation

enum ListSection {
    case firstRow([ListItem])  // большая ячейка
    case tiles([ListItem])     // маленькая ячейка
    
    var items: [ListItem] {
        switch self {
        case .firstRow(let items),
        case .tiles(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .firstRow(_):
            return "firstRow"
        case .tiles(_):
            return "tile"
        }
    }
}


