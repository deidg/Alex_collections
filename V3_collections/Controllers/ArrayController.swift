//
//  ArrayNavigationController.swift
//  V3_collections
//
//  Created by Alex on 19.03.2023.
//

import Foundation
import UIKit
import SnapKit

class ArrayController: UIViewController {
    
    let cellArrayContollerMain = CellArrayContollerMain()
    let tableViewArrayMain = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .green
        setupNavBar()
        setupUI()
    }
    let cellIdArrayMain = "cellIdArrayMain"
    
    func setupUI() {
        self.tableViewArrayMain.delegate = self
        self.tableViewArrayMain.dataSource = self
        tableViewArrayMain.backgroundColor = .blue
        
        tableViewArrayMain.register(CellArrayContollerMain.self, forCellReuseIdentifier: cellIdArrayMain)
        
        tableViewArrayMain.tableFooterView = UIView()
        
        //        view = tableViewArrayMain
        
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Array"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
}
// MARK: extensions
extension ArrayController: UITableViewDelegate {
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //
    //    }
    
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 1
    //    }
}
extension ArrayController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdArrayMain) //as! CellArrayContollerMain //  после as! можно отрубить
//        cell?.textLabel?.text = String
        
//    cell?.textLabel?.text = String(arrayVC[indexPath.row])
        return cell!
    }
}
