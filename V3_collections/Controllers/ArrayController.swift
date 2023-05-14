//
//  ArrayController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//


import UIKit
import SnapKit

class ArrayController: UIViewController {
    //MARK: array data
    private var taskForFirstCellArray: [String] = [
        "Create array for 10 mln elements: "
    ]
    private var taskArray: [String] = [
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
    //MARK: UI elements
    private let arrayManager = ArrayManager()
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Constants.Colors.mainBackgroundColor
        collectionView.register(ArrayViewCell.self, forCellWithReuseIdentifier: Constants.collectionViewCellIdentifier)
        return collectionView
    }()
    
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContraints()
        setupDelegates()
        setupConfiguration()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }
    //MARK: delegates
    private func setupDelegates() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    //MARK: Items On View
    private func setupConfiguration(){
        navigationItem.largeTitleDisplayMode = .never
        title = "Array"
        view.backgroundColor = .white
    }
    // MARK: methods
    private func setupContraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
// MARK: extensions - delegate
extension ArrayController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskForFirstCellArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionViewCellIdentifier, for: indexPath) as? ArrayViewCell else { return UICollectionViewCell() }
        let item = taskForFirstCellArray[indexPath.row]
        cell.textToShow = item
        cell.backgroundColor = .white //Constants.Colors.firstCellBackgroundColor
        cell.state = .initial
        return cell
    }
}
extension ArrayController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArrayViewCell else { return }
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
            self.arrayManager.insertElementsBeginning1by1 { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 2:
            cell.state = .loading
            self.arrayManager.insertElementsBeginningAtOnce { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 3:
            cell.state = .loading
            self.arrayManager.insertElementsMiddle1by1 { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 4:
            cell.state = .loading
            self.arrayManager.insertElementsMiddleAtOnce { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 5:
            cell.state = .loading
            self.arrayManager.insertElementsEnd1by1 { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 6:
            cell.state = .loading
            self.arrayManager.insertElementsEndAtOnce { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 7:
            cell.state = .loading
            self.arrayManager.removeElementsBeginning1by1 { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 8:
            cell.state = .loading
            self.arrayManager.removeElementsBeginningAtOnce { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 9:
            cell.state = .loading
            self.arrayManager.removeElementsMiddle1by1 { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 10:
            cell.state = .loading
            self.arrayManager.removeElementsMiddleAtOnce { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 11:
            cell.state = .loading
            self.arrayManager.removeElementsEnd1by1 { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        case 12:
            cell.state = .loading
            self.arrayManager.removeElementsEndAtOnce { time in
                cell.state = .result(result: time)
                cell.isUserInteractionEnabled = false
            }
        default:
            break
        }
    }
}
extension ArrayController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 //0.5  делает отступ в таблице 0.5. поменять background во collection View
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // 0.5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.bounds.width, height: 105)
        } else {
            return CGSize(width: (collectionView.bounds.width/2), height: 105)
        }
    }
}
// MARK: extensions - constants
extension ArrayController {
    
    enum Constants {
        static let collectionViewCellIdentifier = "ArrayViewCell"
        enum LabelsTexts {
            static let labelTextColor = UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1)
        }
        enum Borders {
            static let frameBorderColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1).cgColor
        }
        enum Colors {
            static let mainBackgroundColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
            static let firstCellBackgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        }
    }
}

