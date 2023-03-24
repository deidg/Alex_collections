//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//

import Foundation
import UIKit
import SnapKit

class SetController: UIViewController {
    
    let setControllerCell = SetControllerCell()
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
        tableViewSetMain.backgroundColor = .blue // не работает
        
        tableViewSetMain.register(CellArrayContollerMain.self, forCellReuseIdentifier: "setControllerCell")
        
        tableViewSetMain.tableFooterView = UIView()
        
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
}
extension SetController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "setControllerCell")
        cell?.textLabel?.text = "hello world"
        
        return cell! //cellArrayContollerMain
        //    https://stackoverflow.com/questions/59019575/return-empty-cell-to-avoid-force-casting-tableview   vadyan 264k
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}
