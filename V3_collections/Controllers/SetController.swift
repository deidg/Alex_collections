//
//  SetNavigationController.swift
//  V3_collections
//
//  Created by Alex on 21.03.2023.
//

import UIKit
import SnapKit

class SetController: UIViewController {
    private let textField1: UITextField = {
        let textField1 = UITextField()
        textField1.backgroundColor = .white
        textField1.layer.cornerRadius = 5
        textField1.layer.borderColor = CGColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        textField1.layer.borderWidth = 1.0
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField1.leftViewMode = .always
        textField1.leftView = spacerView
        return textField1
    }()
    private let textField2: UITextField = {
        let textField2 = UITextField()
        textField2.backgroundColor = .white
        textField2.layer.cornerRadius = 5
        textField2.layer.borderColor = CGColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        textField2.layer.borderWidth = 1.0
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField2.leftViewMode = .always
        textField2.leftView = spacerView
        return textField2
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
        view.addSubview(answerLabel1)
        answerLabel1.snp.makeConstraints{ make in
            make.top.equalTo(buttonForMatchCharacters.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(buttonForNotMatchCharacters)
        buttonForNotMatchCharacters.snp.makeConstraints{ make in
            make.top.equalTo(buttonForMatchCharacters.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(answerLabel2)
        answerLabel2.snp.makeConstraints{ make in
            make.top.equalTo(buttonForNotMatchCharacters.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        view.addSubview(buttonForUniqueCharacters)
        buttonForUniqueCharacters.snp.makeConstraints{ make in
            make.top.equalTo(buttonForNotMatchCharacters.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
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
            findMatching()
        case buttonForNotMatchCharacters:
            findDifference()
        case buttonForUniqueCharacters:
            findUniqueChars()
        default:
            break
        }
    }
    private func defaultConfiguration() {
        view.backgroundColor = .white
        buttonForMatchCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonForNotMatchCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonForUniqueCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    private func findMatching() {
        let textFromTF1: String = textField1.text ?? ""
        let charSet1 = Set(textFromTF1)
        let textFromTF2: String = textField2.text ?? ""
        let charSet2 = Set(textFromTF2)
        
        let intersectionResult = String(charSet1.intersection(charSet2))
//        zxCFvbn
//        asdCFgh
        answerLabel1.isHidden = false
        answerLabel1.text = intersectionResult
    }
    private func findDifference() {
        let textFromTF1: String = textField1.text ?? ""
        let charSet1 = Set(textFromTF1)
        let textFromTF2: String = textField2.text ?? ""
        let charSet2 = Set(textFromTF2)
        let symmetricDifferenceResult = String(charSet1.symmetricDifference(charSet2))
        answerLabel2.isHidden = false
        answerLabel2.text = symmetricDifferenceResult
    }
    private func findUniqueChars() {
        let textFromTF1: String = textField1.text ?? ""
        let charSet1 = Set(textFromTF1)
        let textFromTF2: String = textField2.text ?? ""
        let charSet2 = Set(textFromTF2)
        let intersectionResult = charSet1.intersection(charSet2)
        let unitedSet = intersectionResult.union(charSet2)
        let uniqueCharSet = String(charSet1.subtracting(unitedSet))
        answerLabel3.isHidden = false
        answerLabel3.text = uniqueCharSet
    }
}


