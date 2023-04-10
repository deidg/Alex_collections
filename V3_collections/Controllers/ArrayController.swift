//
//  ArrayController.swift
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
//    var activityIndicator = UIActivityIndicatorView()
    var flag: Bool = false

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContraints()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
//        myCollectionViewCell.setupActivityIndicator()
        activityIndicatorSetup()
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
    
    var activityIndicator: UIActivityIndicatorView = {
        let  activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
       
        return activityIndicator
    }()
    
    func activityIndicatorSetup() {
        self.view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            //                   activityIndicator.center = self.view.center
            //                   activityIndicator?.hidesWhenStopped = true
            //                   activityIndicator?.style = UIActivityIndicatorView.Style.medium
            //                   activityIndicator?.color = .red
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
        guard let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell else { return }
            
        
        if cell.label.text == taskForFirstCellArray[indexPath.row], flag == true {   //  &&? -  bug?
//            for cell in taskForFirstCellArray {
                switch taskForFirstCellArray[indexPath.row] {
                case "Create Int array with 10_000_000 elements":
                    
                    
                    print("arr")
                case "Insert 1000 elements at the beginning / of the array one-by-one":
//                    activityIndicator.startAnimating()
                    
                    arrayManager.insertElementsBeginning1by1()
                    print("case1")
//                    activityIndicator.startAnimating()
                case "Insert 1000 elements at the beginning / of the array at once":
                    print("case2")
                    arrayManager.insertElementsBeginningAtOnce()
                    
                case "Insert 1000 elements in the middle of / the array one-by-one":
                    print("3")
                    arrayManager.insertElementsMiddle1by1()
                    
                case "Insert 1000 elements in the middle of / the array all at once":
                    print("4")
                    arrayManager.insertElementsMiddleAtOnce()
                case "Insert 1000 elements in the end of the array one-by-one":
                    print("5")
                    arrayManager.insertElementsEnd1by1()
                case "Insert 1000 elements in the end of the array all at once":
                    print("6")
                    arrayManager.insertElementsEndAtOnce()
                    
                    //=====
                    
                case "Remove 1000 elements at the beginning of the array one-by-one":
                    arrayManager.removeElementsBeginning1by1()
                    print("7")
                case "Remove 1000 elements at the beginning of the array":
                    arrayManager.removeElementsBeginningAtOnce()
                    print("8")
                case "Remove 1000 elements in the end of the array one-by-one":
                    arrayManager.removeElementsMiddle1by1()
                    print("9")
                case "Remove 1000 elements in the middle of the array":
                    arrayManager.removeElementsMiddleAtOnce()
                    print("10")
                case "Remove 1000 elements at the end of the array one-by-one":
                    arrayManager.removeElementsEnd1by1()
                    print("11")
                case "Remove 1000 elements at the end of the array":
                    arrayManager.removeElementsEndAtOnce()
                    print("12")
                default: print("error")
                }
            }
        

        //cell. state.

        if flag == false {
//            self.activityIndicator.startAnimating()

        
        arrayManager.createArr { result in
            self.taskForFirstCellArray.append(contentsOf: self.taskArray)
            cell.label.text = "Creation time: \(result)"
            self.flag = true
            
            //change state
//            self.activityIndicator.stopAnimating()
       
//            collectionView.reloadData()
        }
            self.taskForFirstCellArray.append(contentsOf: self.taskArray)
            
//        activityIndicator.stopAnimating()

        collectionView.reloadData()
        }
        

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




//найти вариант с флагом. скопировать этот кусок кода или вставить сюда флаг. надо подумать.
