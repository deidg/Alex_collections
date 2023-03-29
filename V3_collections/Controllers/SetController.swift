//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//
// TODO: появляется возврат в Array - хотя это set, т.е. не работает кнопка возврата. Появляется на сразу, а после захода в Array
//https://www.youtube.com/watch?v=dmWFLRGWPUs


import UIKit
import SnapKit

class SetController: UIViewController {
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: SetController.createLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        // Group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(2/5)
            ),
            subitem: item,
            count: 2
        )
        
        // Sections
        let section = NSCollectionLayoutSection(group: group)
        
        
        // Return
        return UICollectionViewCompositionalLayout(section: section)
    }
}


extension SetController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
}


