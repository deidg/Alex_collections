//
//  ArrayNavigationController.swift
//  V3_collections
//
//  Created by Alex on 19.03.2023.
//

// разобраться как делить на секции и строчки.


import Foundation
import UIKit
import SnapKit

class ArrayController: UIViewController {
    
    //    let cellArrayContollerMain = CellArrayContollerMain()
    //    let cellArrayContollerMain2 = CellArrayContollerMain()
    let sections = ["MainSection","CommonSections"]
    let infoLabels = [
        ["label0"],
        ["label1", "label2", "label3", "label4", "label5", "label6",
         "label7", "label8", "label9", "label10", "label11", "label12"]
    ]
    
    let tableViewArrayMain = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .green
        setupNavBar()
        setupUI()
    }
        let cellIdArrayMain = "cellArrayContollerMain"
    //    let cellIdArrayMain2 = "cellArrayContollerMain2"
    
    
    func setupUI() {
        tableViewArrayMain.delegate = self
        tableViewArrayMain.dataSource = self
        
//        self.tableViewArrayMain.delegate = self
//        self.tableViewArrayMain.dataSource = self
        tableViewArrayMain.backgroundColor = .systemBackground
        
        tableViewArrayMain.register(CellArrayContollerMain.self, forCellReuseIdentifier: "cellArrayContollerMain")
        
//        tableViewArrayMain.tableFooterView = UIView()
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("the row tapped")
    }
}
extension ArrayController: UITableViewDataSource {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoLabels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoLabels[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellArrayContollerMain", for: indexPath)
        cell.textLabel?.text = infoLabels[indexPath.section][indexPath.row]
        
        return cell //UITableViewCell
        //    https://stackoverflow.com/questions/59019575/return-empty-cell-to-avoid-force-casting-tableview   vadyan 264k
    }
   
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}
