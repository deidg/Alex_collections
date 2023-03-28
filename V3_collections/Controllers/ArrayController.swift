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
    
    private let arrayCollectionView: UICollectionView = {
        let arrayCollectionViewLayout = UICollectionViewLayout()
        let arrayCollectionView = UICollectionView(frame: .zero, collectionViewLayout: arrayCollectionViewLayout)
        arrayCollectionView.backgroundColor = .none
        arrayCollectionView.bounces = false
        arrayCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return arrayCollectionView
    }()
    
    private let sections = MockData.shared.pageData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .systemBackground
        setupNavBar()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(arrayCollectionView)
        
        arrayCollectionView.register(ArrayCollectionViewCell.self, forCellWithReuseIdentifier: "ArrayCollectionViewCell")
        arrayCollectionView.register(ArrayCVTilesCell.self, forCellWithReuseIdentifier: "ArrayCollectionViewCell")
        
        
        
        //        tableViewArray = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        //        tableViewArray.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        tableViewArray.backgroundColor = .gray
        //
        //        //  еще раз найти откуда появляется эта ячейка "cell". не аттавизм ли это?
        ////        tableViewArray.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ArrayCollectionViewCell")
        //
     
        //
        //        //1.33.20
        //        setupDataSource()
        //        reloadData()
        //
        ////        tableViewArray.delegate = self
        ////        tableViewArray.dataSource = self
        //    }
        
        private func setDelegates() {
            arrayCollectionView.delegate = self
            arrayCollectionView.dataSource = self
        }
        //}
        
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
        
        //    func reloadData() {
        //        var snapshot = NSDiffableDataSourceSnapshot<SectionKind, Int>()
        //        //        let itemPerSection = 10
        //        SectionKind.allCases.forEach { (sectionKind) in
        //            snapshot.appendSections([sectionKind])
        //            snapshot.appendItems([1], toSection:  sectionKind)
        //        }
        //        dataSource.apply(snapshot, animatingDifferences: false)
        //    }
        
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
}

// MARK:  extensions
extension ArrayController: UICollectionViewDelegate {
    
}

extension ArrayController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .firstRow(let firstRow):
            guard let cell = arrayCollectionView.dequeueReusableCell(withReuseIdentifier: arrayCollectionViewCell,
                                                                     for: indexPath) as? ArrayCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: firstRow[indexPath.row].image)//  Название картинки
            return cell
            
        case.tiles(let tiles):
            guard let cell = arrayCollectionView.dequeueReusableCell(withReuseIdentifier: arrayCollectionViewCell,
                                                                     for: indexPath) as? ArrayCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: tiles[indexPath.row].image)  // d 16.40 он говорит о тайтле
            return cell
        }
    }
}

extension ArrayController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            arrayCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            arrayCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            arrayCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            arrayCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
    }
}
    
    



