//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

import Foundation
import UIKit

class CollectionVC: UIViewController {
    //    let arrayVC: [UIViewController] = [arrayController, setController, dictionaryController]
    //        var array2 = [UIViewController]()
    
    let arrayController = ArrayController()
    let setController = SetController()
    let dictionaryController = DictionaryController()
    
    let arrayVC: [UIViewController] = []()
    arrayVC.append(arrayController)
    arrayVC.append(setController)
    arrayVC.append(dictionaryController)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setup()
        setupNavBar()
        view.backgroundColor = .gray
        setupViews()
        
        //        let initialPage = 0
        
        //
        //                        array2.append(arrayController)
        //                        array2.append(setController)
        //                        array2.append(dictionaryController)
    }
    
    let cellId = "cellId"
    
    //        var tableView = UITableView()
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)  // framed вместо grouped
    //    self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    
    //    func setup() {
    //        let arrayController = ArrayController()
    //        let setController = SetController()
    //        let dictionaryController = DictionaryController()
    //    }
    
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(Cell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
        view = tableView
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
    }
    
    
    
}

class TableViewCell: UITableViewCell {
    
}


// MARK: extensions
extension CollectionVC: UITableViewDelegate {
    
    //        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //            return arrayVC.count
    //        }
    //        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    //            if cell == nil {
    //                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    //            }
    //            cell?.textLabel?.text = arrayVC[indexPath.row]
    //            return cell!
    //        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(arrayVC[indexPath.row], animated: true)   // .viewController, animated: true)
        //    }
    }
}
extension CollectionVC: UITableViewDataSource {
    
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
}

