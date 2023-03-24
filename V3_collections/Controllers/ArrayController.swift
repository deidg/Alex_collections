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
    let tableViewArrayMain = UITableView() //.init(frame: .zero, style: UITableView.Style.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .green
        setupNavBar()
        setupUI()
    }
    let cellIdArrayMain = "cellArrayContollerMain"
    
    func setupUI() {
        self.tableViewArrayMain.delegate = self
        self.tableViewArrayMain.dataSource = self
        tableViewArrayMain.backgroundColor = .blue
        
        tableViewArrayMain.register(CellArrayContollerMain.self, forCellReuseIdentifier: "cellArrayContollerMain")
        
        tableViewArrayMain.tableFooterView = UIView()
        
        view.addSubview(tableViewArrayMain)
        tableViewArrayMain.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Array"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
}
// MARK: extensions
extension ArrayController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 100
    //    }
}
extension ArrayController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellArrayContollerMain")
        cell?.textLabel?.text = "hello world"

        return cell! //cellArrayContollerMain
//    https://stackoverflow.com/questions/59019575/return-empty-cell-to-avoid-force-casting-tableview   vadyan 264k
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}
