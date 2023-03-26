//
//  SetCollectionViewCell.swift
//  V3_collections
//
//  Created by Alex on 26.03.2023.
//

import UIKit

class SetCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "setCell"
               
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
}
