//
//  ArrayCollectionViewCell.swift
//  V3_collections
//
//  Created by Alex on 26.03.2023.
//

import UIKit
import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with intValue: Int)
}

class ArrayCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
    
    
    static var reuseId: String = "User cell"
    
    let friendImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }

    func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendImageView.backgroundColor = .blue
        addSubview(friendImageView)
        friendImageView.frame = self.bounds
        backgroundColor = .green
        
    }
    
    func configure(with intValue: Int) {
        print("123")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



/*
class ArrayCollectionViewCell: UICollectionViewCell {
    static let identifier = "ArrayCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images = [
            UIImage(named: "pic1"),
            UIImage(named: "pic2"),
            UIImage(named: "pic3"),
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
*/
