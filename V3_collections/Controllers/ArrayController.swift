//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//
// TODO: 1. ПРисвоить ячейкам имена
//2.  в отдельный файл вынести методы по коллекциям?
// 3.    26 мин.




import UIKit
import SnapKit

class ArrayController: UIViewController {
    
    var myArray: [Int] = []
    var cellArray: [UICollectionViewCell] = []
    let myCollectionViewCell = MyCollectionViewCell()
    let cell = Cell()
    let taskArray = TaskArray()
    
    
    private var collectionView: UICollectionView = {
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
        
        appendToArray()

        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
    }
    
    func appendToArray() {
        cellArray.append(myCollectionViewCell)
    }
     
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAt indexPath: IndexPath) -> CGSize {
         if indexPath.row == 0 {
             return CGSize(width: collectionView.bounds.width, height: 100)
         } else {
             return CGSize(width: (collectionView.bounds.width/2), height: 100)
         }
     }
 
    func setupContraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
//    var cellNamesArray: String = []
    




    
    
    
    
}






extension ArrayController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellArray.count
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
            var counter = 0
            while counter <= 11 {

                myCollectionViewCell.label.text = "veff"
                
                cellArray.append(myCollectionViewCell)
                counter += 1
            }

            collectionView.backgroundColor = .red
            var integerArray = [Int](0...100)
            collectionView.reloadData()
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



