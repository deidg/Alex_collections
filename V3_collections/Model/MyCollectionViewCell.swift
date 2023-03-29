//
//  MyCollectionViewCell.swift
//  V3_collections
//
//  Created by Alex on 29.03.2023.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static var identifier = "MyCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)  //  название массива
        
        let images: [UIImage] = [
            UIImage(named: "pic1"),
            UIImage(named: "pic2"),
            UIImage(named: "pic3"),
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
