
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
    
    //TODO: lines between cells
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create Int array with"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.backgroundColor = .yellow  // .systemBackground  //
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        contentView.addSubview(label)
//        setupActivityIndicator()
        labelSetup()
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
    func labelSetup() {
        contentView.addSubview(label)
        label.snp.makeConstraints{ make in
            make.leading.top.trailing.bottom.equalToSuperview().inset(2)
        }
    }
    
    var activityIndicator: UIActivityIndicatorView = {
        let  activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
        return activityIndicator
    }()
    
//     MARK: activity Indicator
    func setupActivityIndicator() {
        activityIndicator.center = self.label.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.red
        label.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints{ make in
            make.center.equalTo(label)
        }
    }
    
    private func applyState(_ state: State) {
        func initialState() {
//            print("Cell inited from MyCollectionViewCell")
//            label.text = "blyaaa!"
        }

        func loadingState() {
            activityIndicator.startAnimating()
            label.text = "yeahaa!"
        }

        func showResultState() {
            activityIndicator.stopAnimating()
            label.text = "Execution time: "
        }
        
        switch state {
        case .initial:
            initialState()
        case .loading:
            loadingState()
        case .result:
            showResultState()
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
