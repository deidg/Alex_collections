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
    let arrayManager = ArrayManager()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
//    let titleLabel: UILabel = {
//        let titleLabel = UILabel()
////        titleLabel.font = Constants.Fonts.titleLabelFont //titleLabelFont
//        titleLabel.textAlignment = .center
//        titleLabel.backgroundColor = .white
////        titleLabel.text = Constants.Labels.largeLabelText //largeLabelText
//        return titleLabel
//    }()
    
    
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // цвет нижней части
        collectionView.backgroundColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
//        navigat
        //UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        
        
        
        
//        collectionView.layer.borderWidth = 5
//        collectionView.layer.borderColor = UIColor.yellow.cgColor
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.bottom.equalToSuperview()
        }
        view.addSubview(topView)
        topView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    
    var taskForFirstCellArray: [String] = [
        "Create array for 10 mln elements: "
    ]
    var taskArray: [String] = [
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
        
        let item = taskForFirstCellArray[indexPath.row]
        cell.textToShow = item
        
        // цвет ячейки
        cell.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        
        
//        cell.layer.borderColor = .init(red: 010, green: 220, blue: 150, alpha: 1)
//        cell.layer.borderWidth = 1
        //         */
        //        cell.textToShow = taskForFirstCellArray[indexPath.row]   //  ПОДУМАТЬ  сделать без textToShow
        cell.state = .initial
        
        return cell
    }
}

extension ArrayController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell else { return }
        
        //TODO: make enum
        switch indexPath.item {
        case 0:
            
            cell.state = .loading
            
            self.arrayManager.createArr { time in
      
                self.taskForFirstCellArray[0] = "creation time: \(time)"
                self.taskForFirstCellArray.append(contentsOf: self.taskArray)
                
                collectionView.reloadData()
                
                cell.state = .result(result: time)

                cell.isUserInteractionEnabled = false

            }

            
            
        case 1:
            cell.state = .loading
//            DispatchQueue.global(qos: .userInitiated).async {
//                [weak self] in
                self.arrayManager.insertElementsBeginning1by1 { time in
                    cell.state = .result(result: time)
//                }
            }
            
        case 2:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.insertElementsBeginningAtOnce { time in
                    cell.state = .result(result: time)
                }
            }
            
        case 3:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.insertElementsMiddle1by1 { time in
                    cell.state = .result(result: time)
                }
            }
        case 4:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.insertElementsMiddleAtOnce { time in
                    cell.state = .result(result: time)
                }
            }
        case 5:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.insertElementsEnd1by1 { time in
                    cell.state = .result(result: time)
                }
            }
        case 6:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.insertElementsEndAtOnce { time in
                    cell.state = .result(result: time)
                }
            }
        case 7:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.removeElementsBeginning1by1 { time in
                    cell.state = .result(result: time)
                }
            }
        case 8:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.removeElementsBeginningAtOnce { time in
                    cell.state = .result(result: time)
                }
            }
        case 9:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.removeElementsMiddle1by1 { time in
                    cell.state = .result(result: time)
                }
            }
        case 10:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.removeElementsMiddleAtOnce { time in
                    cell.state = .result(result: time)
                }
            }
        case 11:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.removeElementsEnd1by1 { time in
                    cell.state = .result(result: time)
                }
            }
        case 12:
            cell.state = .loading
            DispatchQueue.global(qos: .userInitiated).async {
                [weak self] in
                self?.arrayManager.removeElementsEndAtOnce { time in
                    cell.state = .result(result: time)
                }
            }
        default:
            break
        }
//              collectionView.reloadData()

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



