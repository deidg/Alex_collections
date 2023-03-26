//
//  ArrayNavigationController.swift
//  V3_collections
//
//  Created by Alex on 19.03.2023.
//

// разобраться как делить на секции и строчки.


import Foundation
import UIKit
import SnapKit

class ArrayController: UIViewController {
    
    private let arrayCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .green
        arrayCollectionView.delegate = self
        arrayCollectionView.dataSource = self
        
        view.addSubview(arrayCollectionView)
        
    }
    
    func setupUI() {
        
        
    }

func setupNavBar() {
    navigationController?.navigationBar.topItem?.title = "Array"
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationController?.navigationBar.backgroundColor = .yellow
}
}
// MARK: extensions
extension UICollectionViewDelegate {
    
}

extension UICollectionViewDataSource {
    
}
