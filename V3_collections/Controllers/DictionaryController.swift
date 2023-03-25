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

    let sections = ["MainSection","CommonSections"]
    let infoLabels = [
        ["label0"],
        ["label1", "label2", "label3", "label4", "label5", "label6",
         "label7", "label8", "label9", "label10", "label11", "label12"]
    ]
    
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
        tableViewDictionaryMain.backgroundColor = .systemBackground
        
        tableViewDictionaryMain.register(CellArrayContollerMain.self, forCellReuseIdentifier: "dictionaryControllerCell")
        
        tableViewDictionaryMain.tableFooterView = UIView()
        
        view.addSubview(tableViewDictionaryMain)
        tableViewDictionaryMain.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Dictionary"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
}
    
    
// MARK: extensions
extension DictionaryController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("the row tapped")
    }
}
extension DictionaryController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoLabels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoLabels[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryControllerCell", for: indexPath)
        cell.textLabel?.text = infoLabels[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}


