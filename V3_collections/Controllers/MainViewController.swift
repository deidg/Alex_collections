//
//  ViewController.swift
//  V3_collections
//
//  Created by Alex on 17.03.2023.

// откатиться на init commit  и там сделать новую ветку - попробовать там пройти по пути индуса.
// https://www.youtube.com/watch?v=OuohoFpeGkA&t=12s


import UIKit
import SnapKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        array.append("Array")
        array.append("Set")
        array.append("Dictionary")
        
        //        setupItemsOnView()
    }

    func tableView(_ tableview: UITableView, _: numberOfRowsInSection, section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        return cell!
    }
    

}
//extension MainViewController {
//    // MARK: extension MainVC - constants
//    enum Constants {
//        enum Colors {
//            static let backroundColor = UIColor(red: 125, green: 125, blue: 125, alpha: 1.0)
//        }
//    }
//}
