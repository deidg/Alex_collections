//
//  DictionaryController.swift
//  V3_collections
//
//  Created by Alex on 22.03.2023.
//

import UIKit

//надо сделать:
//- переменную State
//- activity Indicator
//- начал в DictionaryManager делать case 2,3,4  Сделал экземлпря класса DictionaryManager в Dictionary controller. Делал методы - - искать пооследнее вхождение, первое входение

class DictionaryController: UIViewController {
    
    let dictionaryManager = DictionaryManager()
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
        return activityIndicator
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // цвет нижней части
        collectionView.backgroundColor = .white //UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
        return collectionView
    }()
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view?.backgroundColor = .cyan
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setupContraints()
        makingCollections()
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")

        dictionaryManager.fillArray()
        dictionaryManager.fillDictionary()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
                if indexPath.row <= 1 {
                    return CGSize(width: collectionView.bounds.width/2, height: 70)
                } else {
                    return CGSize(width: (collectionView.bounds.width/2), height: 105)
                }
    }
    
    func setupContraints() {
        view.addSubview(topView)
        topView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
    func makingCollections() {
        
//        видимо для индикации надо сделать отдельный state
        activityIndicator.startAnimating()
        
        let array = [Int](0..<100_000)
        var dictionary: [Int: String] = [:]
        for i in 0...100 {
            dictionary[i] = "\(i)"
        }
        activityIndicator.stopAnimating()
//                print(array)
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

extension DictionaryController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell else
        { return UICollectionViewCell() }
        
        let item = titlesArray[indexPath.row]
        cell.textToShow = item
        
        
        //TODO: вертикальная черта на первой строчке - сделать
        // цвет ячейки
        if indexPath.row <= 1 {
            cell.backgroundColor = .white
            cell.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        } else {
            cell.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        }
        cell.state = .initial
        
        return cell
    }
    
    
    
}

extension DictionaryController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell else { return }
        
        
        switch indexPath.item {
        case 0:
            cell.isUserInteractionEnabled = false
            print("1")
        case 1:
            cell.isUserInteractionEnabled = false
            print("2")
//        case 2:
//            dictionaryManager.printArr()
            
            
        case 3:
//            cell.isUserInteractionEnabled = false
            print("4")
            
            
            
            
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
}
