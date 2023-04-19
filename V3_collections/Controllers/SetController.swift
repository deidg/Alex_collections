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
        textField1.layer.cornerRadius = 5
        textField1.layer.borderColor = CGColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        textField1.layer.borderWidth = 1.0
        
//        textField1.font
        return textField1
    }()
    let textField2: UITextField = {
        let textField2 = UITextField()
        textField2.backgroundColor = .white
        textField2.layer.cornerRadius = 5
        textField2.layer.borderColor = CGColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        textField2.layer.borderWidth = 1.0


        
        
        //        textField1.font
        return textField2
    }()
    
    let buttonForMatchCharacters: UIButton = {
        let buttonForMatchCharacters = UIButton()
        buttonForMatchCharacters.backgroundColor = .orange
        buttonForMatchCharacters.setTitle("All matching letters", for: .normal)
        
        //        textField2.frame = CGRect(x: 100, y: 100, width: 100, height: 50)

        
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
            make.top.equalTo(view).offset(150)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        view.addSubview(textField2)
        textField2.snp.makeConstraints{ make in
            make.top.equalTo(textField1.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
}


