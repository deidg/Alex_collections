
//
//  MyCollectionViewCell.swift
//  V3_collections
//
//  Created by Alex on 29.03.2023.
//

import Foundation
import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell {
    static var identifier = "MyCollectionViewCell"

//TODO: setup background color
        let label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Create Int array with"
            label.backgroundColor = UIColor(red: 166, green: 197, blue: 198, alpha: 1)
            label.font = .systemFont(ofSize: 20, weight: .medium)
            return label
        }()
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(label)
}
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    func printMes() {
        print("hekko")
//        superview.backgroundColor = .red

    }
}
    
  






    func printMes() {

//        print("print smth")
            var integerArray = [Int](0...100)
//            self.backgroundColor = .red
            print(integerArray)
        
        
//        label.backgroundColor = .systemPink
//        print(myArray)
    }


    //========================
//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
////        imageView.clipsToBounds = true
////        imageView.contentMode = .scaleAspectFill
////        imageView.frame.height = 30
//        return imageView
//    }()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(imageView)
        
//        let images: [UIImage] = [
//            UIImage(named: "pic1"),
////            UIImage(named: "pic2"),
////            UIImage(named: "pic3"),
//        ].compactMap({ $0 })
//        imageView.image = images.randomElement()
//        contentView.clipsToBounds = true
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        imageView.frame = contentView.bounds
//    }
//}



//var array10mln: [Int] = []
////        let array10mln = [Int]()
//for i in 0...10 {
//    array10mln.append(2)
//}
