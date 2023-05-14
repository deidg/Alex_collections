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
        case .result(let result, let flag):
            activityIndicator.stopAnimating()
            label.isHidden = false
            
            if flag == 0 {
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
    }
    enum Constants {
        enum LabelsTexts {
            static let labelTextColor = UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1)
        }
    }
}
