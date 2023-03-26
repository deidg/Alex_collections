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
    
//
    
    let tableViewDictionaryMain = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .cyan
        setupNavBar()
        setupUI()
    }
    let daictionaryCell = "dictionaryControllerCell"

    func setupUI() {
//        self.tableViewDictionaryMain.delegate = self
//        self.tableViewDictionaryMain.dataSource = self
        tableViewDictionaryMain.backgroundColor = .systemBackground
        
        
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



