//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//
// TODO: появляется возврат в Array - хотя это set, т.е. не работает кнопка возврата. Появляется на сразу, а после захода в Array

import Foundation
import UIKit
import SnapKit

class SetController: UIViewController {
    
    let setControllerCell = SetControllerCell()
    
    let sections = ["MainSection","CommonSections"]
    let infoLabels = [
        ["label0"],
        ["label1", "label2", "label3", "label4", "label5", "label6",
         "label7", "label8", "label9", "label10", "label11", "label12"]
    ]
    let tableViewSetMain = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .systemPink
        setupNavBar()
        setupUI()
    }
    let setCell = "setControllerCell"
    
    func setupUI() {
        self.tableViewSetMain.delegate = self
        self.tableViewSetMain.dataSource = self
        tableViewSetMain.backgroundColor = .systemBackground
//        tableViewSetMain.estimatedRowHeight = 30

        
        tableViewSetMain.register(CellArrayContollerMain.self, forCellReuseIdentifier: "setControllerCell")
        
//        tableViewSetMain.tableFooterView = UIView()
        
        view.addSubview(tableViewSetMain)
        tableViewSetMain.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Set"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
}


// MARK: extensions
extension SetController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 100
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("the row tapped")
    }
}
extension SetController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoLabels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoLabels[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "setControllerCell", for: indexPath)
        cell.textLabel?.text = infoLabels[indexPath.section][indexPath.row]

        return cell //cellArrayContollerMain
        //    https://stackoverflow.com/questions/59019575/return-empty-cell-to-avoid-force-casting-tableview   vadyan 264k
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.frame.height = 30.0 //50.0
//    }
}
