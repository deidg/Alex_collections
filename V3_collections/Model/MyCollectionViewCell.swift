
//
//  MyCollectionViewCell.swift
//  V3_collections
//
//  Created by Alex on 29.03.2023.
//

import Foundation
import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell {
    static var identifier = "MyCollectionViewCell"
    //    var activityIndicator = UIActivityIndicatorView()
    var state: State = .initial {
        didSet {
            applyState(state)
        }
    }
    var textToShow: String = "" {     //  ПОКА НЕ СТИРАТЬ!!!
        didSet {
            label.text = textToShow
        }
    }
    
    //TODO: lines between cells
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0  //
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellSetupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
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
        case .result(let result):
            activityIndicator.stopAnimating()
            label.isHidden = false
            label.text = "Execution time: \(result)"
        }
    }
}

extension MyCollectionViewCell {
    enum State {
        case initial
        case loading
        case result(result: Double)
    }
    
}
