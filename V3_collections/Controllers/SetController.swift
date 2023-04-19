//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//

import UIKit
import SnapKit

class SetController: UIViewController {
    
//    private let setView: UIView = {
////        let setView = UIView()
//        let setView = UIView()
////        setView.layoutGuides = .
////        setView.backgroundColor = .green
//        return setView
//    }()
 
    let textField1: UITextField = {
        let textField1 = UITextField()
        textField1.backgroundColor = .white
//        textField1.layer.cornerRadius = 3
//        textField1.font
        return textField1
    }()
    let textField2: UITextField = {
        let textField2 = UITextField()
        textField2.backgroundColor = .white
//        textField2.layer.cornerRadius = 3  // для View
        //        textField1.font
        return textField2
    }()
    
    let buttonForMatchCharacters: UIButton = {
        let buttonForMatchCharacters = UIButton()
        buttonForMatchCharacters.backgroundColor = .orange
        buttonForMatchCharacters.setTitle("All matching letters", for: .normal)
//        buttonForMatchCharacters.font.color
        buttonForMatchCharacters.setTitleColor(.blue, for: .normal)
        
        
        return buttonForMatchCharacters
    }()
    let buttonForNotMatchCharacters: UIButton = {
        let buttonForNotMatchCharacters = UIButton()
        buttonForNotMatchCharacters.backgroundColor = .yellow
        buttonForNotMatchCharacters.setTitle("All characters that do not match", for: .normal)
        buttonForNotMatchCharacters.setTitleColor(.blue, for: .normal)

        
        return buttonForNotMatchCharacters
    }()
    let buttonForUniqueCharacters: UIButton = {
        let buttonForUniqueCharacters = UIButton()
        buttonForUniqueCharacters.backgroundColor = .blue
        buttonForUniqueCharacters.setTitle("All unique characters from the first text field that do not match in text fields", for: .normal)
        buttonForUniqueCharacters.setTitleColor(.blue, for: .normal)

        
        return buttonForUniqueCharacters
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUIelements()
    }
    
    private func setupUIelements() {
        view.addSubview(textField1)
        textField1.snp.makeConstraints{ make in
            make.top.equalTo(view).offset(100)
            make.leading.trailing.equalTo(view).offset(16)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
}


