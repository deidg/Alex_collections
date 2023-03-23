//
//  cellArayContollerMain.swift
//  V3_collections
//
//  Created by Alex on 23.03.2023.
//

import UIKit
import SnapKit

//    tableView.rowHeight = 100
class CellArrayContollerMain: UITableViewCell {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        return titleLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        let titleLabel = titleLabel
        titleLabel.text = "Array for 10mln rows"
    }
    
    
}
