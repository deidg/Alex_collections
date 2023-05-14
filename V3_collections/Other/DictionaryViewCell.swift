//
//  DictionaryViewCell.swift
//  V3_collections
//
//  Created by Alex on 04.05.2023.
//

import Foundation
import SnapKit

class DictionaryViewCell: UICollectionViewCell {
    //MARK: UI elements
    static let identifier = "DictionaryViewCell"
    var state: State = .initial {
        didSet {
            applyState(state)
        }
    }
    var textToShow: String = "" {
        didSet {
            label.text = textToShow
        }
    }
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = Constants.LabelsTexts.labelTextColor
        return label
    }()
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.layer.borderColor = CGColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
//        self.layer.borderWidth = 1
        cellSetupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        return nil
    }
//MARK: methods
    private func cellSetupUI() {
        contentView.addSubview(label)
        label.snp.makeConstraints{ make in
            make.leading.top.trailing.bottom.equalToSuperview().inset(2)
        }
        contentView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
    }
    private func applyState(_ state: State) {
        switch state {
        case .initial:
            return
        case .loading:
            activityIndicator.startAnimating()
            label.isHidden = true
        case .result(let result, let element):
            activityIndicator.stopAnimating()
            label.isHidden = false
            label.text = "Search time: \(result) sec\n Result number: \(element)" // if lelemnt not found
        case .resultFoundedOrNot (let result, let notFounded):
            activityIndicator.stopAnimating()
            label.isHidden = false
            if notFounded == true {
                label.text = "Search time: \(result) sec\n non existing element: not found"
            } else {
                label.text = "Search time: \(result) sec\n non existing element: found"
            }
        }
    }
}
//MARK: extensions
extension DictionaryViewCell {
    enum State {
        case initial
        case loading
        case result(result: Double, positionOfElement: Int)
        case resultFoundedOrNot(result: Double, notFounded: Bool)
    }
    enum Constants {
        enum LabelsTexts {
            static let labelTextColor = UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1)
        }
        enum Borders {
//            static let frameBorderColor = //.green //UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1).cgColor
        }
    }
}
