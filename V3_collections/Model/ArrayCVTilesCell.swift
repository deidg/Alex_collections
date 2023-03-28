//
//  ArrayCVTilesCell.swift
//  V3_collections
//
//  Created by Alex on 28.03.2023.
//

import UIKit

//protocol SelfConfiguringCell {
//    static var reuseId: String { get }
//    func configure(with intValue: Int)
//}

class ArrayCVTilesCell: UICollectionViewCell {
    
    private let tilesImage: UIImageView = {
        let tilesImage = UIImageView()
        tilesImage.contentMode = .scaleAspectFit
        tilesImage.image = UIImage(named: "pic1")
        tilesImage.translatesAutoresizingMaskIntoConstraints = false
        return tilesImage
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 2
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        
        addSubview(tilesImage)
        addSubview(categoryLabel)
    }
    
    func configureCell(tales: String , imageName: String) {
        categoryLabel.text = tales    //
        tilesImage.image = UIImage(named: imageName)   //  TODO:  странное название файла!!!
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -5),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
            
            tilesImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            tilesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            tilesImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            tilesImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}


/*
 static var reuseId: String = "ArrayCollectionViewCell"
 
 let friendImageView = UIImageView()
 
 override init(frame: CGRect) {
 super.init(frame: frame)
 backgroundColor = UIColor.purple
 
 //        backgroundColor = UIColor(white: 1, alpha: 1)
 setupConstraints()
 
 self.layer.cornerRadius = 4
 self.clipsToBounds = true
 }
 
 func setupConstraints() {
 friendImageView.translatesAutoresizingMaskIntoConstraints = false
 friendImageView.backgroundColor = .systemPink   // COLOR
 addSubview(friendImageView)
 friendImageView.frame = self.bounds
 backgroundColor = .red                   // COLOR
 
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
 */
