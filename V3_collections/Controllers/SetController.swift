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
    //MARK: UI elements
    private let textField1: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Constants.Borders.textFieldCornerRadius
        textField.layer.borderColor = Constants.Borders.textFieldBorderColor
        textField.layer.borderWidth = Constants.Borders.textFieldBorderWidth
        let spacerView = UIView(frame: Constants.FrameCGRect.rect)
        textField.leftViewMode = .always
        textField.leftView = spacerView
        return textField
    }()
    private let textField2: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Constants.Borders.textFieldCornerRadius
        textField.layer.borderColor = Constants.Borders.textFieldBorderColor
        textField.layer.borderWidth = Constants.Borders.textFieldBorderWidth
        let spacerView = UIView(frame: Constants.FrameCGRect.rect)
        textField.leftViewMode = .always
        textField.leftView = spacerView
        return textField
    }()
    private let buttonForMatchCharacters: UIButton = {
        let buttonForMatchCharacters = UIButton()
        buttonForMatchCharacters.backgroundColor = .white
        buttonForMatchCharacters.setTitle(Constants.ButtonTexts.buttonForMatchCharactersText, for: .normal)
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
        buttonForNotMatchCharacters.setTitle(Constants.ButtonTexts.buttonForNotMatchCharactersText, for: .normal)
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
        buttonForUniqueCharacters.setTitle(Constants.ButtonTexts.buttonForUniqueCharactersText, for: .normal)
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
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIelements()
        defaultConfiguration()
        addTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }
    //MARK: Items On View
    private func setupUIelements() {
        view.addSubview(textField1)
        textField1.snp.makeConstraints{ make in
            make.top.equalTo(view).offset(Constants.Constraints.topViewOffset)
            make.horizontalEdges.equalToSuperview().inset(Constants.Constraints.horizontalEdgesInset)
            make.height.equalTo(Constants.Constraints.standartHeightConstraint)
        }
        view.addSubview(textField2)
        textField2.snp.makeConstraints{ make in
            make.top.equalTo(textField1.snp.bottom).offset(Constants.Constraints.minimumTopOfset)
            make.horizontalEdges.equalToSuperview().inset(Constants.Constraints.horizontalEdgesInset)
            make.height.equalTo(Constants.Constraints.standartHeightConstraint)
        }
        view.addSubview(buttonForMatchCharacters)
        buttonForMatchCharacters.snp.makeConstraints{ make in
            make.top.equalTo(textField2.snp.bottom).offset(Constants.Constraints.buttonForMatchCharactersOffset)
            make.horizontalEdges.equalToSuperview().inset(Constants.Constraints.horizontalEdgesInset)
            make.height.equalTo(Constants.Constraints.standartHeightConstraint)
        }
        view.addSubview(answerLabel1)
        answerLabel1.snp.makeConstraints{ make in
            make.top.equalTo(buttonForMatchCharacters.snp.bottom).offset(Constants.Constraints.minimumTopOfset)
            make.horizontalEdges.equalToSuperview().inset(Constants.Constraints.horizontalEdgesInset)
            make.height.equalTo(Constants.Constraints.standartHeightConstraint)
        }
        view.addSubview(buttonForNotMatchCharacters)
        buttonForNotMatchCharacters.snp.makeConstraints{ make in
            make.top.equalTo(buttonForMatchCharacters.snp.bottom).offset(Constants.Constraints.standartTopOfset)
            make.horizontalEdges.equalToSuperview().inset(Constants.Constraints.horizontalEdgesInset)
            make.height.equalTo(Constants.Constraints.standartHeightConstraint)
        }
        view.addSubview(answerLabel2)
        answerLabel2.snp.makeConstraints{ make in
            make.top.equalTo(buttonForNotMatchCharacters.snp.bottom).offset(Constants.Constraints.minimumTopOfset)
            make.horizontalEdges.equalToSuperview().inset(Constants.Constraints.horizontalEdgesInset)
            make.height.equalTo(Constants.Constraints.standartHeightConstraint)
        }
        view.addSubview(buttonForUniqueCharacters)
        buttonForUniqueCharacters.snp.makeConstraints{ make in
            make.top.equalTo(buttonForNotMatchCharacters.snp.bottom).offset(Constants.Constraints.standartTopOfset)
            make.horizontalEdges.equalToSuperview().inset(Constants.Constraints.horizontalEdgesInset)
            make.height.equalTo(Constants.Constraints.maxHeightConstraint)
        }
        view.addSubview(answerLabel3)
        answerLabel3.snp.makeConstraints{ make in
            make.top.equalTo(buttonForUniqueCharacters.snp.bottom).offset(Constants.Constraints.minimumTopOfset)
            make.horizontalEdges.equalToSuperview().inset(Constants.Constraints.horizontalEdgesInset)
            make.height.equalTo(Constants.Constraints.standartHeightConstraint)
        }
    }
    //MARK: methods
    @objc private func buttonPressed(sender: UIButton) {
        switch sender {
        case buttonForMatchCharacters:
            let textFromTF1 = textField1.text ?? ""
            let textFromTF2 = textField2.text ?? ""
            let result = setManager.findMatching(textField1: textFromTF1, textField2: textFromTF2)
            answerLabel1.text = result
            answerLabel1.isHidden = false
        case buttonForNotMatchCharacters:
            let textFromTF1 = textField1.text ?? ""
            let textFromTF2 = textField2.text ?? ""
            let result = setManager.findDifference(textFromTF1: textFromTF1, textFromTF2: textFromTF2)
            answerLabel2.text = result
            answerLabel2.isHidden = false
        case buttonForUniqueCharacters:
            let textFromTF1 = textField1.text ?? ""
            let textFromTF2 = textField2.text ?? ""
            let result = setManager.findUniqueChars(textFromTF1: textFromTF1, textFromTF2: textFromTF2) 
            answerLabel3.text = result
            answerLabel3.isHidden = false
        default:
            break
        }
    }
    private func defaultConfiguration() {
        view.backgroundColor = .white
        self.navigationItem.title = "Set"
    }
    //MARK: targets
    private func addTargets() {
        buttonForMatchCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonForNotMatchCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonForUniqueCharacters.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}
// MARK: extension
extension SetController {
    enum Constants {
        enum Borders {
            static let textFieldBorderColor = CGColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
            static let textFieldBorderWidth = 1.0
            static let textFieldCornerRadius = CGFloat(5)
        }
        enum Constraints {
            static let topViewOffset = 150
            static let minimumTopOfset = 10
            static let standartTopOfset = 40
            static let horizontalEdgesInset = 16
            static let standartHeightConstraint = 30
            static let maxHeightConstraint = 30
            static let buttonForMatchCharactersOffset = 50
        }
        enum ButtonTexts {
            static let buttonForMatchCharactersText = "All matching letters"
            static let buttonForNotMatchCharactersText = "All characters that do not match"
            static let buttonForUniqueCharactersText = "All unique characters from the first text field that do not match in text fields"
        }
        enum FrameCGRect {
            static let rect = CGRect(x:0, y:0, width:10, height:10)
        }
    }
}

