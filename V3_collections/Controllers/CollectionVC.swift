//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

//TODO:  - пофиксить баг - при загрузке экран с названием Коллекция. А при возврате - Array. Вариант - возвращать VC через pop?

import Foundation
import UIKit

class CollectionVC: UIViewController {
    
    //    let collectionVC = CollectionVC()
    let arrayController = ArrayController()
    let setController = SetController()
    let dictionaryController = DictionaryController()
    
  
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
//        titleLabel.font = Constants.Fonts.titleLabelFont //titleLabelFont
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .white
//        titleLabel.text = Constants.Labels.largeLabelText //largeLabelText
        return titleLabel
    }()
    
    
    
    
    let arrayVC = ["Array", "Set", "Dictionary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupViews()
    }
    
    let cellId = "cellId"
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)  // framed вместо grouped
    
    
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .white
        
        tableView.register(Cell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
//        tableView.backgroundColor = .systemPink
        
        view = tableView
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Collections"
        //        navigationController?.navigationBar.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        //        navigationController?.navigationBar.prefersLargeTitles = true
        //        navigationController?.navigationBar.backgroundColor = .yellow
    }
    
    
    
//    tableView.addSubview(titleLabel)
//    titleLabel.snp.makeConstraints { make in
//        make.leading.trailing.equalToSuperview().inset(16)
//        make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(64)
//        make.height.equalTo(41)
//    }
   
    
}

//class TableViewCell: UITableViewCell {
//
//}

// MARK: extensions
extension CollectionVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            self.show(arrayController, sender: self)
            navigationController?.navigationBar.backgroundColor = .white
//            navigationController.shared.statusBarView?.backgroundColor = UIColor.red
//            tableView.backgroundColor = .systemPink

            
            
//            navigationController?.navigationBar.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            //UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        case 1:
            self.show(setController, sender: self)
        case 2:
            self.show(dictionaryController, sender: self)
        default:
            print("")
        }
    }
}

//TODO:  убрать cell! стр 83
extension CollectionVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = String(arrayVC[indexPath.row])
        return cell!
    }
}
