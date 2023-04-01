//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//

import UIKit
import SnapKit

class ArrayController: UIViewController {
    
    var myArray: [Int] = []
//    var myArray = [Int]()
    let myCollectionViewCell = MyCollectionViewCell()
    
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //        layout.minimumInteritemSpacing = 0
        //        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContraints()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
    
    
    
    
    
    /*
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
     sizeForItemAt indexPath: IndexPath) -> CGSize {
     if indexPath.row == 0 {
     return CGSize(width: collectionView.bounds.width, height: 100)
     } else {
     return CGSize(width: (collectionView.bounds.width/2), height: 100)   //
     
     //            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
     //            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) +
     //            (flowayout?.sectionInset.left ?? 0.0) +
     //            (flowayout?.sectionInset.right ?? 0.0)
     //            let size: CGFloat = (collectionView.frame.size.width - space) / 2.0
     //            return CGSize(width: size, height: 100)
     }
     }
     */
    
    func setupContraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
extension ArrayController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell",
                                                            for: indexPath) as? MyCollectionViewCell else
        { return UICollectionViewCell() }
        cell.backgroundColor = .yellow
        return cell
    }
}

extension ArrayController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        func cellTapped() {
            collectionView.backgroundColor = .red
            var integerArray = [Int](0...100)
            //                        print(integerArray)
        }
   cellTapped()

    
    }
}

extension ArrayController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
   
}

