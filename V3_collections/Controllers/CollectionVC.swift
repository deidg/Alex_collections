//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

import Foundation
import UIKit

class CollectionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let array = ["Array", "Set", "Dictionary"]
//      var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .gray
        setupViews()
        
        let initialPage = 0
        let page1 = ArrayNavigationController()

//        pages.append(page1)
        
//        let newViewController = NewViewController()
        self.navigationController?.pushViewController(page1, animated: true)
        
//        setViewControllers([array[IndexPath]], direction: .forward, animated: true, completion: nil)
        
//        func setViewControllers(_ viewControllers: [array[IndexPath]], animated: Bool
//        )
        
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
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = array[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
    }
   
    
//    @objc func presentArrayNC() {
//          let viewController = ArrayNavigationController()
//        present(viewController, animated: true, completion: nil)
//
//    }
}




