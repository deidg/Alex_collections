//
//  CollectionVC.swift
//  V3_collections
//
//  Created by Alex on 18.03.2023.
//

import Foundation
import UIKit

class CollectionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = [String]() // Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .systemRed
        
        array.append("Array")
        array.append("Set")
        array.append("Dictionary")
        
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
    return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = array[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
    }
    
//    @objc func didTapButton() {
//        navigationController?.pushViewController(ArrayVC(), animated: true)
//    }
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let idCell = "idCell"
    
    
}


//class ArrayVC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGreen
//    }
//}

//extension MainViewController: UITableViewDelegate{
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath:  IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
//
//    return cell
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat
//    })
//}
