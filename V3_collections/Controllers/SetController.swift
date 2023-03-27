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
    
    private var collectionView: UICollectionView?
//    var screenWidth: CGFloat!
    let width = UIScreen.main.bounds.width

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .systemPink
//        screenWidth = screenSize.width
        setupNavBar()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-3,
                                 height: (view.frame.size.height/8)-9)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(SetCollectionViewCell.self,
                                forCellWithReuseIdentifier: SetCollectionViewCell.identifier)
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
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetCollectionViewCell.identifier,
                                                      for: indexPath)
//        cell.contentView.backgroundColor = .systemBlue
        return cell
    }
   
}
extension SetController: UICollectionViewDelegate {
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//       
////        if indexPath.row == 0
////        {
////            return CGSize(width = view.frame.size.width,
////                                height = view.frame.size.height)
////        }
////        return CGSize(width: (view.frame.size.width/2)-3,
////                       height: (view.frame.size.height/8)-9)
//    }
}
