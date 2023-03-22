//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

import Foundation
import UIKit

class CollectionVC: UIViewController {

    let arrayController = ArrayController()
    let setController = SetController()
    let dictionaryController = DictionaryController()
    
    let arrayVC = ["Array", "Set", "Dictionary"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setup()
        setupNavBar()
        view.backgroundColor = .gray
        setupViews()
    }
    
    let cellId = "cellId"
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)  // framed вместо grouped
  
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(arrayVC[indexPath.row], animated: true)
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
        cell?.textLabel?.text = String(arrayVC[indexPath.row])
        return cell!
    }
}
