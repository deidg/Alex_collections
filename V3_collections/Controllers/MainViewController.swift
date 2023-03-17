//
//  ViewController.swift
//  V3_collections
//
//  Created by Alex on 17.03.2023.

import UIKit
import SnapKit

class MainViewController: UIViewController {
//    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnView()
    }
    
    // MARK: Items
    private let mainTableView: UITableView = {
        let mainTableView = UITableView()
        mainTableView.backgroundColor = .red // Constants.Colors.backroundColor
        return mainTableView
    }()

    
    // MARK: UI setup
    private func setupItemsOnView() {
        
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

    }
}
extension MainViewController {
    // MARK: extension MainVC - constants
    enum Constants {
        enum Colors {
            static let backroundColor = UIColor(red: 125, green: 125, blue: 125, alpha: 1.0)
        }
    }
}
