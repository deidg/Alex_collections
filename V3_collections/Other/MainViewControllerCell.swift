//
// MainViewControllerCell   ( ex Cell.swift before 09.05.23)
//  V3_collections
//
//  Created by Alex on 26.03.2023.

import UIKit

class MainViewControllerCell: UITableViewCell {
    //MARK: UI elements
    let titleLabel = UILabel()
    var collection: String? {
        didSet {
            guard let array = collection else { return }
            titleLabel.text = collection
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

