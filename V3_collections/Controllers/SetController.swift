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
        textField1.layer.cornerRadius = 5
        textField1.layer.borderColor = CGColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        textField1.layer.borderWidth = 1.0
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10)) //отступ от левого края
        textField1.leftViewMode = .always
        textField1.leftView = spacerView
        return textField1
    }()
    let textField2: UITextField = {
        let textField2 = UITextField()
        textField2.backgroundColor = .white
        textField2.layer.cornerRadius = 5
        textField2.layer.borderColor = CGColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        textField2.layer.borderWidth = 1.0
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10)) //отступ от левого края
        textField2.leftViewMode = .always
        textField2.leftView = spacerView
        return textField2
    }()
    let buttonForMatchCharacters: UIButton = {
        let buttonForMatchCharacters = UIButton()
        buttonForMatchCharacters.backgroundColor = .white
        buttonForMatchCharacters.setTitle("All matching letters", for: .normal)
        buttonForMatchCharacters.setTitleColor(.blue, for: .normal)
        return buttonForMatchCharacters
    }()
    let buttonForNotMatchCharacters: UIButton = {
        let buttonForNotMatchCharacters = UIButton()
        buttonForNotMatchCharacters.backgroundColor = .white
        buttonForNotMatchCharacters.setTitle("All characters that do not match", for: .normal)
        buttonForNotMatchCharacters.setTitleColor(.blue, for: .normal)
        return buttonForNotMatchCharacters
    }()
    let buttonForUniqueCharacters: UIButton = {
        let buttonForUniqueCharacters = UIButton()
        buttonForUniqueCharacters.backgroundColor = .white
        buttonForUniqueCharacters.setTitle("All unique characters from the first text field that do not match in text fields", for: .normal)
        buttonForUniqueCharacters.titleLabel?.lineBreakMode = .byWordWrapping
        buttonForUniqueCharacters.titleLabel?.textAlignment = .center
        buttonForUniqueCharacters.setTitleColor(.blue, for: .normal)
        return buttonForUniqueCharacters
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIelements()
        defaultConfiguration()
        makeAnswerLabel1()
        makeAnswerLabel2()
        makeAnswerLabel3()
    }
    
    private func setupUIelements() {
        view.addSubview(textField1)
        textField1.snp.makeConstraints{ make in
            make.top.equalTo(view).offset(150)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(textField2)
        textField2.snp.makeConstraints{ make in
            make.top.equalTo(textField1.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(buttonForMatchCharacters)
        buttonForMatchCharacters.snp.makeConstraints{ make in
            make.top.equalTo(textField2.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(buttonForNotMatchCharacters)
        buttonForNotMatchCharacters.snp.makeConstraints{ make in
            make.top.equalTo(buttonForMatchCharacters.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(buttonForUniqueCharacters)
        buttonForUniqueCharacters.snp.makeConstraints{ make in
            make.top.equalTo(buttonForNotMatchCharacters.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
    }
    
    func  makeAnswerLabel1() {
        let answerLabel1 = UILabel()
        answerLabel1.backgroundColor = .orange
        
        view.addSubview(answerLabel1)
        answerLabel1.snp.makeConstraints{ make in
            make.top.equalTo(buttonForMatchCharacters.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        
        //раздвигает место под ответ
//        view.addSubview(buttonForNotMatchCharacters)
//        buttonForNotMatchCharacters.snp.makeConstraints{ make in
//            make.top.equalTo(AnswerLabel1.snp.bottom).offset(100)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(30)
//        }
    
    }
    
    func  makeAnswerLabel2() {
        let answerLabel2 = UILabel()
        answerLabel2.backgroundColor = .orange
        
        view.addSubview(answerLabel2)
        answerLabel2.snp.makeConstraints{ make in
            make.top.equalTo(buttonForNotMatchCharacters.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
    }
  
    func  makeAnswerLabel3() {
        let answerLabel3 = UILabel()
        answerLabel3.backgroundColor = .orange
        
        view.addSubview(answerLabel3)
        answerLabel3.snp.makeConstraints{ make in
            make.top.equalTo(buttonForUniqueCharacters.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
    }
    
    @objc private func buttonPressed(sender: UIButton) {
        switch sender {
        case buttonForMatchCharacters:
            print("1")
        case buttonForNotMatchCharacters:
            print("2")
        case buttonForUniqueCharacters:
            print("3")
        default:
            print("")
        }
    }
    
    private func defaultConfiguration() {
        view.backgroundColor = .white
        buttonForMatchCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonForNotMatchCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonForUniqueCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}

extension SetController {
    
    
}


