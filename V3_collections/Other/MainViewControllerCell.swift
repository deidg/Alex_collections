//
// MainViewControllerCell   ( ex Cell.swift before 09.05.23)
//  V3_collections
//
//  Created by Alex on 26.03.2023.

import UIKit

class MainViewControllerCell: UITableViewCell {
    let titleLabel = UILabel()
    var collection: String? {
        didSet {
            guard let array = collection else { return }
            titleLabel.text = collection
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

extension MainViewControllerCell {
    func setup() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    func layout() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
