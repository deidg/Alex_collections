//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

import Foundation
import UIKit

class CollectionVC: UIViewController {
    
//    let collectionVC = CollectionVC()
    let arrayController = ArrayController()
    let setController = SetController()
    let dictionaryController = DictionaryController()
    
    let arrayVC = ["Array", "Set", "Dictionary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupViews()
    }
    
    let cellId = "cellId"
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)  // framed вместо grouped
    
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .red

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            self.show(arrayController, sender: self)
        case 1:
            self.show(setController, sender: self)
        case 2:
            self.show(dictionaryController, sender: self)
        default:
            print("")
        }
    }
}

//TODO:  убрать cell! стр 83
extension CollectionVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = String(arrayVC[indexPath.row])
        return cell!
    }
}
