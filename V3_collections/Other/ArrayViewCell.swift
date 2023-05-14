
//
//  MyCollectionViewCell.swift
//  V3_collections
//
//  Created by Alex on 29.03.2023.
//

import Foundation
import SnapKit

class ArrayViewCell: UICollectionViewCell {
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
        return activityIndicator
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = Constants.Borders.frameBorderColor
        self.layer.borderWidth = 1
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
            make.edges.equalToSuperview().inset(2)
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
        case .result(let result):
            activityIndicator.stopAnimating()
            label.isHidden = false
            label.text = "Execution time: \(result) sec"
        }
    }
}
// MARK: State
extension ArrayViewCell {
    enum State {
        case initial
        case loading
        case result(result: Double)
    }
}
// MARK: Constants
extension ArrayViewCell {
    enum Constants {
        enum LabelsTexts {
            static let labelTextColor = UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1)
        }
        enum Borders {
            static let frameBorderColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1).cgColor
        }
    }
}
