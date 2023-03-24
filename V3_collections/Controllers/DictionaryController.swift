//
//  DictionaryController.swift
//  V3_collections
//
//  Created by Alex on 22.03.2023.
//

import Foundation
import UIKit
import SnapKit


class DictionaryController: UIViewController {
    
    let dictionaryControllerCell = DictionaryControllerCell()
    let tableViewDictionaryMain = UITableView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .cyan
        setupNavBar()
        setupUI()
    }
    let daictionaryCell = "dictionaryControllerCell"

    func setupUI() {
        self.tableViewDictionaryMain.delegate = self
        self.tableViewDictionaryMain.dataSource = self
        tableViewDictionaryMain.backgroundColor = .cyan 
        
        tableViewDictionaryMain.register(CellArrayContollerMain.self, forCellReuseIdentifier: "dictionaryControllerCell")
        
        tableViewDictionaryMain.tableFooterView = UIView()
        
        view.addSubview(tableViewDictionaryMain)
        tableViewDictionaryMain.snp.makeConstraints{ make in
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
extension DictionaryController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 100
    //    }
}
extension DictionaryController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryControllerCell")
        cell?.textLabel?.text = "hello world"
        
        return cell! //cellArrayContollerMain
        //    https://stackoverflow.com/questions/59019575/return-empty-cell-to-avoid-force-casting-tableview   vadyan 264k
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}


