//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//

import UIKit
import SnapKit

class SetController: UIViewController {
    
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
        
        
        
        
        
        return buttonForMatchCharacters
    }()
    let buttonForNotMatchCharacters: UIButton = {
        let buttonForNotMatchCharacters = UIButton()
        
        return buttonForNotMatchCharacters
    }()
    let buttonForUniqueCharacters: UIButton = {
        let buttonForUniqueCharacters = UIButton()
        
        return buttonForUniqueCharacters
    }()
    
    override func viewDidLoad() {
        setupUIelements()
    }
    
    private func setupUIelements() {
        
    }
    
}


