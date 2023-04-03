
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
    
    var activityIndicator = UIActivityIndicatorView()
    
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
        setupActivityIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    
    // MARK: activity Indicator

    func setupActivityIndicator() {
        activityIndicator.center = self.label.center

        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
        label.addSubview(activityIndicator)
    }
    
    // indicator turn ON
    func activityIndicatorOn() {
        activityIndicator.startAnimating()
        //        view.isUserInteractionEnabled = false
    }

    // indicator turn OFF
    func activityIndicatorOff() {

        self.activityIndicator.stopAnimating()
        //        self.view.isUserInteractionEnabled = true
    }
    
    
    
    
    
    
//    func printMes() {
//        //        print("print smth")
//        var integerArray = [Int](0...100)
//        //            self.backgroundColor = .red
//        print(integerArray)
        
        
        //        label.backgroundColor = .systemPink
        //        print(myArray)
//    }
}

