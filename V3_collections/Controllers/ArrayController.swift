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
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .green
        setupNavBar()
        setupUI()
    }
    let cellId = "cellId"

    func setupUI() {
        tableView.backgroundColor = .blue
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(CellArrayContollerMain.self, forCellReuseIdentifier: cellId)
    
//        view.addSubview(tableView)
//        view.snp.makeConstraints{ make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            //               make.top.equalTo(navigationController?.navigationBar.bott)
//            make.leading.equalToSuperview()
//               make.trailing.equalToSuperview()
//
//            tableView.reloadData()
//        }
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Array"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
}
// MARK: extensions
extension ArrayController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1
    }
}
extension ArrayController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CellArrayContollerMain //  после as! можно отрубить
        
        return cell
    }
}
