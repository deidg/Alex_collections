//
//  DictionaryController.swift
//  V3_collections
//
//  Created by Alex on 22.03.2023.
//

import UIKit


class DictionaryController: UIViewController {

    var tableViewDictionary: UICollectionView! // УБРАТЬ - ! !!!()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .cyan
        setupNavBar()
        setupCV()
    }

    func setupCV() {
        tableViewDictionary = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        tableViewDictionary.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableViewDictionary.backgroundColor = .gray
        view.addSubview(tableViewDictionary)
        tableViewDictionary.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "dictionaryCell")
        
        tableViewDictionary.delegate = self
        tableViewDictionary.dataSource = self
    }
    
    
    
   
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Dictionary"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
}
    
    
// MARK: extensions

extension DictionaryController: UICollectionViewDelegate {
    
}

extension DictionaryController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dictionaryCell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension DictionaryController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 70)
    }
}





//
//import SwiftUI
//struct FlowProvider: PreviewProvider {
//    static var previews: some View {
//        ContainerView().edgesIgnoringSafeArea(.all)
//    }
//
//    struct ContainterView: UIViewControllerRepresentable {
//
//        let tabBar = MainTabBarController()
//        func makeUIViewController(context: Context) -> some UIViewController {
//            UIViewControllerRepresentableContext<FlowProvider.ContainterView>) ->
//            MainTabBarController {
//                return tabBar
//            }
//
//            func updateUIVewController(_ uiViewController:
//                                       FlowProvider.ContainterView.UIViewControllerType, context:
//                                       UIViewControllerRepresentableContext<FlowProvider.ContainterView>) {
//
//            }
//        }
//    }
//}
