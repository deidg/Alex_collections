//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

//TODO: backgroundColor  основного экрана сделать белым

import Foundation
import UIKit

class CollectionVC: UIViewController {
    private let arrayController = ArrayController()
    private let setController = SetController()
    private let dictionaryController = DictionaryController()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .white
        return titleLabel
    }()
    private let cellId = "cellId"
    private let arrayVC = ["Array", "Set", "Dictionary"]
    private let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
        return activityIndicator
    }()
    
    var accessoryView: UIView? = {
        let accessoryView = UIView()
        return accessoryView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupViews()
    }

    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        tableView.register(Cell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView() 
        view = tableView
    }
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Collections"
    }
}

// MARK: extensions
extension CollectionVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.show(arrayController, sender: self)
            navigationController?.navigationBar.backgroundColor = .white
        case 1:
            self.show(setController, sender: self)
        case 2:
//            activityIndicator.startAnimating()
            self.show(dictionaryController, sender: self)
            
//                activityIndicator.stopAnimating()
            
        default:
            print("")
        }
    }
}

extension CollectionVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVC.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        }
        
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text = String(arrayVC[indexPath.row])
        return cell ?? UITableViewCell()                           
    }
}
