
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
    var activityIndicator = UIActivityIndicatorView()
    var state: State = .initial {
        didSet {
            applyState(state)
        }
    }
    
    //TODO: setup number of lines
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create Int array with"
        label.backgroundColor = .yellow  // .systemBackground  //
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        setupActivityIndicator()
        //        activityIndicator.startAnimating()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    // MARK: activity Indicator
    func setupActivityIndicator() {
        //        activityIndicator.center = self.label.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
        contentView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
    }
    
    private func applyState(_ state: State) {
        func initialState() {
            print("Cell inited")
        }
        
        func loadingState() {
            activityIndicator.startAnimating()
        }
        
        func showResultState() {
            activityIndicator.stopAnimating()
        }
    }
}

extension MyCollectionViewCell {
    enum State {
        case initial
        case loading
        case result
    }
    
}
