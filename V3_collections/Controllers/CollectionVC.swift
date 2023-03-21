//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

import Foundation
import UIKit

class CollectionVC: UIViewController, UITableViewDelegate,  UITableViewDataSource {  //, UITableViewDelegate,  UITableViewDataSource
    let arrayVC = ["Array", "Set", "Dictionary"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .gray
        setupViews()
  
//        pages.append(page1)
//        pages.append(page2)
        
//        navigationController?.pushViewController(page1, animated: true)
//                navigationController?.pushViewController(page2, animated: true)

    }
    let initialPage = 0
    var page1 = ArrayNavigationController()
    var page2 = SetNavigationController()
    
    let cellId = "cellId"
    var tableView = UITableView()
    

    func setupViews() {
        tableView.delegate = self
//        tableView.dataSource = self

        tableView.register(Cell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()

        view = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVC.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = arrayVC[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.tableView == page1 {
            print("page1 tapped")
        } else {
            print("page1 tapped")
        }
        
//        switch indexPath.row {
//        case 0:
//            navigationController?.pushViewController(page1, animated: true) // page1
//        case 1:
//            navigationController?.pushViewController(page2, animated: true)  // page2
//        default:
//            print("hello")
//        }
    }
    
    
    
    
    
    
    

    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
    }

}

/*
extension CollectionVC: UITableViewDelegate {
    
//    @objc func collectionView ( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath
//    ) {
    
    //===
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrayVC.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            cell?.textLabel?.text = arrayVC[indexPath.row]
            return cell!
        }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
              case 0:
            navigationController?.pushViewController(page1, animated: true)
              case 1:
            navigationController?.pushViewController(page1, animated: true)
            default:
              print("hello")
            }
        //===
        
//        switch indexPath.section {
//        case 0: return section0.tableViewDidSelectRowAt(tableView, didSelectRowAt: indexPath)
//        case 1: return section1.tableViewDidSelectRowAt(tableView, didSelectRowAt: indexPath)
    }
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            tableView. // .deselectRow(at: arrayVC.indexPath, animated: true)
//        }
//    }
    
    
//    optional func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath
//    )

}

//extension CollectionVC: UITableViewDataSource {
//
//
//}
*/
