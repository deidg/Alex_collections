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
        collectionViewLayout: UICollectionViewLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayCollectionView.register(ArrayCollectionViewCell.self,
                                     forCellWithReuseIdentifier: ArrayCollectionViewCell.identifier)
        view?.backgroundColor = .green
        arrayCollectionView.delegate = self
        arrayCollectionView.dataSource = self
        
        view.addSubview(arrayCollectionView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        arrayCollectionView.frame = view.bounds
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
extension ArrayController: UICollectionViewDelegate {
    
}

extension ArrayController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = arrayCollectionView.dequeueReusableCell(withReuseIdentifier: ArrayCollectionViewCell.identifier,
                                                           for: indexPath)
        return cell
    }
    
    
}
