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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .systemPink
        setupNavBar()
        setupUI()
    }
    let setCell = "setControllerCell"
    
    func setupUI() {
//        self.tableViewSetMain.delegate = self
//        self.tableViewSetMain.dataSource = self
//        tableViewSetMain.backgroundColor = .systemBackground
//        tableViewSetMain.estimatedRowHeight = 30

    }
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Set"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
}


// MARK: extensions

