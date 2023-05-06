//
//  Cell.swift
//  V3_collections
//
//  Created by Alex on 26.03.2023.
//

//  ячейка для CollectionVC

import UIKit

class Cell: UITableViewCell {

    let titleLabel = UILabel()
    
    var collection: String? {
        didSet {
            guard let array = collection else { return }
            titleLabel.text = collection
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    cell.accessoryType = UITableViewCellAccessoryType
//    cell.accessoryType = .disclosureIndicator

    
    
    
}

extension Cell {

    func setup() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        // don't disable translatesAutoresizingMaskIntoConstraints on the cell itself
        contentView.addSubview(titleLabel) // important!
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
