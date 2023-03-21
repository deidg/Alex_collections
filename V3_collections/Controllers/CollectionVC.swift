//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

import Foundation
import UIKit

class CollectionVC: UIViewController, UITableViewDataSource {  //, UITableViewDelegate
    let arrayVC = ["Array", "Set", "Dictionary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .gray
        setupViews()
        
        let initialPage = 0
        let page1 = ArrayNavigationController()
        
        navigationController?.pushViewController(page1, animated: true)
    }
  
    let cellId = "cellId"

    var tableView = UITableView()

    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self

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
        tableView.deselectRow(at: arrayVC.indexPath, animated: true)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
    }

}

extension CollectionVC: UITableViewDelegate {
    
    @objc func collectionView ( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath
    ) {
        
    }
    
    
//    optional func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    )

}
