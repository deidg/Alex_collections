//
//  DictionaryController.swift
//  V3_collections
//
//  Created by Alex on 22.03.2023.
//

import UIKit

class DictionaryController: UIViewController {
    //MARK: UI elements
    let dictionaryManager = DictionaryManager()
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // цвет нижней части
        collectionView.backgroundColor = .white
        return collectionView
    }()
    // из за этого кода стала появляться надписть Collection при загрузке VC, но исчез отсутп сверху
//    private let topView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }()
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContraints()
        setupElements()
        self.activityIndicator.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            self.makingCollections()
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.collectionView.reloadData()
                self.collectionView.delegate = self
                self.collectionView.dataSource = self
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Dictionary"
    }
    //MARK: Items On View
    private func setupContraints() {
//        view.addSubview(topView)
//        topView.snp.makeConstraints{ make in
//            make.top.equalToSuperview()
//            make.horizontalEdges.equalToSuperview()
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
//        }
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.horizontalEdges.bottom.equalToSuperview()
        }
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
    }
    func setupElements() {
        collectionView.register(DictionaryViewCell.self, forCellWithReuseIdentifier: "DictionaryViewCell")
    }
    //MARK: methods
    func makingCollections() {
        self.dictionaryManager.fillArray()
        self.dictionaryManager.fillDictionary()
    }
    let titlesArray: [String] = [
        "Array",
        "Dicitonary",
        "Find the first contact",
        "Find the first contact",
        "Find the last contact",
        "Find the last contact",
        "Find the non-existing element",
        "Find the non-existing element"
    ]
}
// MARK: extensions - delegate
extension DictionaryController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titlesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DictionaryViewCell", for: indexPath) as? DictionaryViewCell else
        { return UICollectionViewCell() }
        
        let item = titlesArray[indexPath.row]
        cell.textToShow = item
        if indexPath.row <= 1 {
            cell.backgroundColor = .white
            cell.layer.borderColor = Constants.Borders.layerBorderColorFirst
        } else {
            cell.backgroundColor = Constants.Borders.layerBorderColorSecond
        }
        cell.state = .initial
        return cell
    }
}
extension DictionaryController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DictionaryViewCell else { return }
        switch indexPath.item {
        case 0:
            cell.isUserInteractionEnabled = false
        case 1:
            cell.isUserInteractionEnabled = false
        case 2:
            cell.state = .loading
            self.dictionaryManager.findFirstElenemtInArray { time, indexPath in
                cell.state = .result(result: time, positionOfElement: indexPath)
                cell.isUserInteractionEnabled = false
            }
        case 3:
            cell.state = .loading
            self.dictionaryManager.findFirstElenemtInArray { time, element in
                cell.state = .result(result: time, positionOfElement: element)
                cell.isUserInteractionEnabled = false
            }
        case 4:
            cell.state = .loading
            self.dictionaryManager.findLastElenemtInArray { time, indexPath in
                cell.state = .result(result: time, positionOfElement: indexPath)
                cell.isUserInteractionEnabled = false
            }
        case 5:
            cell.state = .loading
            self.dictionaryManager.findLastElenemtInDictionary { time, element in cell.state = .result(result: time, positionOfElement: element)
                cell.isUserInteractionEnabled = false
            }
        case 6:
            cell.state = .loading
            self.dictionaryManager.findNotExistingElenemtInArray { time, element in
                cell.state = .resultFoundedOrNot( result: time, notFounded: element)
                cell.isUserInteractionEnabled = false
            }
        case 7:
            cell.state = .loading
            self.dictionaryManager.findNotExistingElenemtInDictionary { time, keyExist in
                cell.state = .resultFoundedOrNot( result: time, notFounded: keyExist)
                cell.isUserInteractionEnabled = false
            }
        default:
            break
        }
    }
}
extension DictionaryController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row <= 1 {
            return CGSize(width: collectionView.bounds.width/2, height: 70)
        } else {
            return CGSize(width: (collectionView.bounds.width/2), height: 105)
        }
    }
}
// MARK: extensions constants
extension DictionaryController {
    enum Constants {
        enum Borders {
            static let layerBorderColorFirst = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
            static let layerBorderColorSecond = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        }
    }
}
