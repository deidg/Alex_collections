//
//  ArrayNavigationController.swift
//  V3_collections
//
//  Created by Alex on 19.03.2023.
//

import Foundation
import UIKit
import SnapKit

class ArrayController: UIViewController {
    
//    let cellArrayContollerMain = CellArayContollerMain()
 
     let cellId = "cellId"
 
    var tableView: UITableView = {
        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = .green
        setupNavBar()
        setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    
    //    private let onlyCharLabel: UILabel = {
    //        let onlyCharLabel = UILabel()
    //        onlyCharLabel.text = Constants.LabelsTexts.onlyCharectersLabelText
    //        onlyCharLabel.backgroundColor = .white
    //        onlyCharLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
    //        onlyCharLabel.font = Constants.LabelsFonts.smallLabelFont
    //        return onlyCharLabel
    //    }()
    
    func setupUI() {
        tableView.backgroundColor = .blue

        view.addSubview(tableView)
        view.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            //               make.top.equalTo(navigationController?.navigationBar.bott)
            make.leading.equalToSuperview()
               make.trailing.equalToSuperview()
            
        }
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Array"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
    }
    

}

extension UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    }
}

extension UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
                return cell
    }
    
}
