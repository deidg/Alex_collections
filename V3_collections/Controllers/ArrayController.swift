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
    
    enum SectionKind: Int, CaseIterable {
        case list, grid3     //  list - bigLable, grid3 - мелкие ячейки
    }
    
    var dataSource: UICollectionViewDiffableDataSource<SectionKind, Int>! = nil
    var tableViewArray: UICollectionView! // УБРАТЬ - ! !!!()

    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .cyan
        setupNavBar()
        setupCV()
    }
    
    func setupCV() {
        tableViewArray = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        tableViewArray.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableViewArray.backgroundColor = .gray
        view.addSubview(tableViewArray)
        tableViewArray.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "dictionaryCell")
        
//        tableViewArray.delegate = self
//        tableViewArray.dataSource = self
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionKind, Int>(collectionView: tableViewArray, cellProvider: { (tableViewArray, indexPath, intValue) -> UICollectionViewCell? in
            let section = SectionKind(rawValue: indexPath.section)!  //  ПРОВЕРИТЬ что будет если убрать знак !
            switch section {
            case .list:
                <#code#>
            case .grid3:
                <#code#>
            }
        })
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // section -> group -> items -> size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .fractionalHeight(0.2)) // вот тут он в 49.00 сделал .fractioalWidth
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Dictionary"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
    
}

// MARK:  extensions
extension ArrayController: UICollectionViewDelegate {
    
}

extension ArrayController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dictionaryCell", for: indexPath)
        cell.backgroundColor = .red
        cell.layer.borderWidth = 1
        return cell
    }
}



