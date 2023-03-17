//
//  ViewController.swift
//  V3_collections
//
//  Created by Alex on 17.03.2023.

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupItemsOnView()
    }
    
    let mainTableView: UITableView = {
        let mainTableView = UITableView()
        
        mainTableView.backgroundColor = .systemGray
        
        
        return mainTableView
    }()
    
    // MARK: UI setup
    private func setupItemsOnView() {
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints{ make in
        make.edges.width.height.equalTo(view)
        }
    }
    
    
    
}
