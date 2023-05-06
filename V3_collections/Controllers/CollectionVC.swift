//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//


//TODO: стрелки направо >  с правой стороны
//TODO: все функции сделать private

import Foundation
import UIKit

class CollectionVC: UIViewController {
    let arrayController = ArrayController()
    let setController = SetController()
    let dictionaryController = DictionaryController()
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .white
        return titleLabel
    }()
    let cellId = "cellId"
    let arrayVC = ["Array", "Set", "Dictionary"]
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupViews()
    }
    
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        tableView.register(Cell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView() 
        view = tableView
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Collections"
        navigationController?.navigationBar.backgroundColor = .yellow
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
            //не понимаю как запустить эту активити индикатор.
            activityIndicator.startAnimating()
            self.show(dictionaryController, sender: self)
            activityIndicator.stopAnimating()
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
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.accessoryType = .disclosureIndicator   // почему то не работает.
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = String(arrayVC[indexPath.row])
        return cell!                                  // как сделать unwrapp?
    }
}
