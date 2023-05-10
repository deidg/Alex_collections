//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//

import UIKit
import SnapKit

class SetController: UIViewController {
    let setManager = SetManager()
    
    private let textField1: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        textField.layer.borderWidth = 1.0
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        return textField
    }()
    private let textField2: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        textField.layer.borderWidth = 1.0
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        return textField
    }()
    private let buttonForMatchCharacters: UIButton = {
        let buttonForMatchCharacters = UIButton()
        buttonForMatchCharacters.backgroundColor = .white
        buttonForMatchCharacters.setTitle("All matching letters", for: .normal)
        buttonForMatchCharacters.setTitleColor(.blue, for: .normal)
        return buttonForMatchCharacters
    }()
    private let answerLabel1: UILabel = {
        let answerLabel1 = UILabel()
        answerLabel1.isHidden = true
        answerLabel1.backgroundColor = .white
        answerLabel1.textAlignment = .center
        return answerLabel1
    }()
    private let buttonForNotMatchCharacters: UIButton = {
        let buttonForNotMatchCharacters = UIButton()
        buttonForNotMatchCharacters.backgroundColor = .white
        buttonForNotMatchCharacters.setTitle("All characters that do not match", for: .normal)
        buttonForNotMatchCharacters.setTitleColor(.blue, for: .normal)
        return buttonForNotMatchCharacters
    }()
    private let answerLabel2: UILabel = {
        let answerLabel2 = UILabel()
        answerLabel2.isHidden = true
        answerLabel2.backgroundColor = .white
        answerLabel2.textAlignment = .center
        return answerLabel2
    }()
    private let buttonForUniqueCharacters: UIButton = {
        let buttonForUniqueCharacters = UIButton()
        buttonForUniqueCharacters.backgroundColor = .white
        buttonForUniqueCharacters.setTitle("All unique characters from the first text field that do not match in text fields", for: .normal)
        buttonForUniqueCharacters.titleLabel?.lineBreakMode = .byWordWrapping
        buttonForUniqueCharacters.titleLabel?.textAlignment = .center
        buttonForUniqueCharacters.setTitleColor(.blue, for: .normal)
        return buttonForUniqueCharacters
    }()
    private let answerLabel3: UILabel = {
        let answerLabel3 = UILabel()
        answerLabel3.isHidden = true
        answerLabel3.backgroundColor = .white
        answerLabel3.textAlignment = .center
        return answerLabel3
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIelements()
        defaultConfiguration()
        makeTarget()
    }
    private func setupUIelements() {
        view.addSubview(textField1)
        textField1.snp.makeConstraints{ make in
            make.top.equalTo(view).offset(150)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(textField2)
        textField2.snp.makeConstraints{ make in
            make.top.equalTo(textField1.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(buttonForMatchCharacters)
        buttonForMatchCharacters.snp.makeConstraints{ make in
            make.top.equalTo(textField2.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(answerLabel1)
        answerLabel1.snp.makeConstraints{ make in
            make.top.equalTo(buttonForMatchCharacters.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(buttonForNotMatchCharacters)
        buttonForNotMatchCharacters.snp.makeConstraints{ make in
            make.top.equalTo(buttonForMatchCharacters.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(answerLabel2)
        answerLabel2.snp.makeConstraints{ make in
            make.top.equalTo(buttonForNotMatchCharacters.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(buttonForUniqueCharacters)
        buttonForUniqueCharacters.snp.makeConstraints{ make in
            make.top.equalTo(buttonForNotMatchCharacters.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        view.addSubview(answerLabel3)
        answerLabel3.snp.makeConstraints{ make in
            make.top.equalTo(buttonForUniqueCharacters.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
    }
    @objc private func buttonPressed(sender: UIButton) {
        switch sender {
        case buttonForMatchCharacters:
            let textFromTF1 = textField1.text ?? ""
            let textFromTF2 = textField2.text ?? ""
            setManager.findMatching(textField1: textFromTF1, textField2: textFromTF2, answerLabel1: answerLabel1)
        case buttonForNotMatchCharacters:
            let textFromTF1 = textField1.text ?? ""
            let textFromTF2 = textField2.text ?? ""
            setManager.findDifference(textFromTF1: textFromTF1, textFromTF2: textFromTF2, answerLabel2: answerLabel2)
        case buttonForUniqueCharacters:
            let textFromTF1 = textField1.text ?? ""
            let textFromTF2 = textField2.text ?? ""
            setManager.findUniqueChars(textFromTF1: textFromTF1, textFromTF2: textFromTF2, answerLabel3: answerLabel3)
        default:
            break
        }
    }
    private func defaultConfiguration() {
        view.backgroundColor = .white
    }
    private func makeTarget() {
        buttonForMatchCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonForNotMatchCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonForUniqueCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}


