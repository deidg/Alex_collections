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
    let cell = Cell()
    let arrayManager = ArrayManager()
    
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
        
    }
    
    var activityIndicator: UIActivityIndicatorView = {
        let  activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
        return activityIndicator
    }()
    
    
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
        "Create array for 10 mln elements: "
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
        
//             рабочий вариант
         let item = taskForFirstCellArray[indexPath.row]
//        ПОКА НЕ СТИРАТЬ!!
         cell.textToShow = item
//         */
//        cell.textToShow = taskForFirstCellArray[indexPath.row]   //  ПОДУМАТЬ  сделать без textToShow
        cell.state = .initial
        
        return cell
    }
}

extension ArrayController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell else { return }
        
        var counter: Bool = true
        
        switch indexPath.item {
        case 0:
//            var counter: Bool = true    // TODO: main label renew -  need to block
//
            if counter == true {
                cell.state = .loading
                self.arrayManager.createArr { time in
                    cell.state = .result(result: time)
                }
                self.taskForFirstCellArray.append(contentsOf: self.taskArray)
                collectionView.reloadData()
                
                print(counter)
                print("=====")
                counter = false
                print(counter)

            } else {
                print("ger")
            }
        case 1:
            cell.state = .loading
            arrayManager.insertElementsBeginning1by1 { time in
                cell.state = .result(result: time)
            }
        case 2:
            cell.state = .loading
            arrayManager.insertElementsBeginningAtOnce { time in
                cell.state = .result(result: time)
            }
        case 3:
            cell.state = .loading
            arrayManager.insertElementsMiddle1by1 { time in
                cell.state = .result(result: time)
            }
        case 4:
            cell.state = .loading
            arrayManager.insertElementsMiddleAtOnce { time in
                cell.state = .result(result: time)
            }
        case 5:
            cell.state = .loading
            arrayManager.insertElementsEnd1by1 { time in
                cell.state = .result(result: time)
            }
        case 6:
            cell.state = .loading
            arrayManager.insertElementsEndAtOnce { time in
                cell.state = .result(result: time)
            }
        case 7:
            cell.state = .loading
            arrayManager.removeElementsBeginning1by1 { time in
                cell.state = .result(result: time)
            }
        case 8:
            cell.state = .loading
            
            arrayManager.removeElementsBeginningAtOnce { time in
                cell.state = .result(result: time)
            }
        case 9:
            cell.state = .loading
            arrayManager.removeElementsMiddle1by1 { time in
                cell.state = .result(result: time)
            }
        case 10:
            cell.state = .loading
            arrayManager.removeElementsMiddleAtOnce { time in
                cell.state = .result(result: time)
            }
        case 11:
            cell.state = .loading
            arrayManager.removeElementsEnd1by1 { time in
                cell.state = .result(result: time)
            }
        case 12:
            cell.state = .loading
            arrayManager.removeElementsEndAtOnce { time in
                cell.state = .result(result: time)
            }
        default:
            break
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



