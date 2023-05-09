//
//  MainViewController (before 09.05.23 CollectionVC.swift)
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

//TODO: сделать везде константы
//TODO: поставить везде MARK
//TODO: сделать запись в обсидиане о сделаных вещах


//TODO: спросить - почему при загрузке ArrayController поздно исчезает название Collections и почему при повторении операции в заголовке вместо Array появляется Collections

import Foundation
import UIKit

final class MainViewController: UIViewController {
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
    //    table
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
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
        tableView.register(MainViewControllerCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        view = tableView
        view.backgroundColor = .white
    }
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Collections"
        //        navigationController?.navigationBar.backItem?.title = "Colletctions2" //topItem?.title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    //    navigationController.navigationBar.prefersLargeTitles = true
}
// MARK: extensions
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.show(arrayController, sender: self)
            navigationController?.navigationBar.backgroundColor = .white
        case 1:
            self.show(setController, sender: self)
        case 2:
            self.show(dictionaryController, sender: self)
        default:
            break
        }
    }
}
extension MainViewController: UITableViewDataSource {
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
