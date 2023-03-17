//
//  ViewController.swift
//  V3_collections
//
//  Created by Alex on 17.03.2023.

import UIKit
import SnapKit

class MainViewController: UIViewController {
//    private let tableView = UITableView()
//    private let mainLabel = UILabel()
    
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

//    private let mainLabel: UILabel = {
//        let mainLabel = UILabel()
//        mainLabel.backgroundColor = .orange // Constants.Colors.backroundColor
//        return mainLabel
//    }()
    
    // MARK: UI setup
    private func setupItemsOnView() {
        
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
//                view.addSubview(mainLabel)
//        mainLabel.snp.makeConstraints { make in
//                    make.edges.equalTo(view)
//                }
        
//        mainView.addSubview(mainLabel)
//        mainLabel.snp.makeConstraints { make in
//            make.top.equalTo(mainView).inset(10)
//            make.height.equalTo(100)
//        }
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
