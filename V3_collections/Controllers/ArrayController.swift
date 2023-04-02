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
    var cellArray: [UICollectionViewCell] = []
    let myCollectionViewCell = MyCollectionViewCell()
    let cell = Cell()
    let arrayManager = ArrayManager()
    
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
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
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
    
    var taskForFirstCellArray: [String] = [
        "Array generation time: "
    ]
    var taskArray: [String] = [
        //for array
        "Insert 1000 elements at the beginning / of the array one-by-one",
        "Insert 1000 elements at the beginning / of the array at once",
        
        "Insert 1000 elements in the middle of / the array one-by-one",
        "Insert 1000 elements in the middle of / the array all at once",
        
        "Insert 1000 elements in the end of the array one-by-one",
        "Insert 1000 elements in the end of the array all at once",
        
        "Remove 1000 elements at the beginning of the array one-by-one",
        "Remove 1000 elements at the beginning of the array",
        
        "Remove 1000 elements in the end of the array one-by-one",
        "Remove 1000 elements in the middle of the array",
        
        "Remove 1000 elements at the end of the array one-by-one",
        "Remove 1000 elements at the end of the array",
        //for set
        "All matching letters",
        "All characters that do not match",
        "All unique characters from the first text field that do not match in text fields",
        // for  3 UIScreen
        "Find the first contact",
        "Find the last contact",
        "Find the non-existing element"
    ]
    
}

extension ArrayController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskForFirstCellArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell",
                                                            for: indexPath) as? MyCollectionViewCell else
        { return UICollectionViewCell() }
        
        let item = taskForFirstCellArray[indexPath.row]
        cell.label.text = item
        cell.label.numberOfLines = 0
        cell.backgroundColor = .yellow
        return cell
    }
}

extension ArrayController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        taskForFirstCellArray.append(contentsOf: taskArray)
        
        collectionView.backgroundColor = .red
        let largeArray = arrayManager.createArray()
        collectionView.reloadData()
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



