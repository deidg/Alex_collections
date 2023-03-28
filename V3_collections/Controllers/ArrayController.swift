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
    
    enum ListSection {
        case firstRow([ListItem])  // большая ячейка
        case tiles([ListItem])     // маленькая ячейка
        
        var items: [ListItem] {
            switch self {
            case .firstRow(let items)
                    .tiles(let items):
                return items
            }
        }
        var count: Int {
            items.count
        }
    }
    
    
    
    
    var dataSource: UICollectionViewDiffableDataSource<SectionKind, Int>! = nil
    var tableViewArray: UICollectionView! // УБРАТЬ - ! !!!()
//    var tableViewArray = UICollectionView() // УБРАТЬ - ! !!!()


    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .systemBackground
        setupNavBar()
        setupCV()
    }
    
    func setupCV() {
        tableViewArray = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        tableViewArray.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableViewArray.backgroundColor = .gray
        view.addSubview(tableViewArray)
        
        //  еще раз найти откуда появляется эта ячейка "cell". не аттавизм ли это?  
//        tableViewArray.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ArrayCollectionViewCell")
        
        tableViewArray.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ArrayCollectionViewCell")
        tableViewArray.register(ArrayCollectionViewCell.self, forCellWithReuseIdentifier: ArrayCollectionViewCell.reuseId)
        
        //1.33.20
        setupDataSource()
        reloadData()

//        tableViewArray.delegate = self
//        tableViewArray.dataSource = self
    }
    
    func configure<T: SelfConfiguringCell>(cellType: T.Type, with intValue: Int, for indexPath: IndexPath) -> T {
        guard let cell =  tableViewArray.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Error \(cellType)")
        }
        return cell
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionKind, Int>(collectionView: tableViewArray, cellProvider: { (tableViewArray, indexPath, intValue) -> UICollectionViewCell? in
            let section = SectionKind(rawValue: indexPath.section)!  //  ПРОВЕРИТЬ что будет если убрать знак !
            switch section {
            default:
                return self.configure(cellType: ArrayCollectionViewCell.self, with: intValue, for: indexPath)
            }
        })
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionKind, Int>()
//        let itemPerSection = 10
        SectionKind.allCases.forEach { (sectionKind) in
            snapshot.appendSections([sectionKind])
            snapshot.appendItems([1], toSection:  sectionKind)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
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



