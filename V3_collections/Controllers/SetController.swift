//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//
// TODO: появляется возврат в Array - хотя это set, т.е. не работает кнопка возврата. Появляется на сразу, а после захода в Array

import UIKit
import SnapKit

class SetController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .systemPink
        setupNavBar()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical          // scrolling
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "setCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
  
    }
    
//    func setupFlowLayout() -> UICollectionViewFlowLayout {
//        let layout = UICollectionViewFlowLayout()
//        
//    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Set"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
}


// MARK: extensions

extension SetController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "setCell",
                                                      for: indexPath)
        cell.contentView.backgroundColor = .systemBlue
        return cell
        
        
    }
}
extension SetController: UICollectionViewDelegate {
    
}
