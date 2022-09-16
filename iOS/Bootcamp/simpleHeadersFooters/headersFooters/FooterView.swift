//
//  FooterView.swift
//  headersFooters
//
//  Created by Lili Cabral on 16/09/22.
//

import Foundation
import UIKit

class TableFooter: UITableViewHeaderFooterView {
    static let identifier = "TableFooter"

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Carro"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "Carro"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(subLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        subLabel.sizeToFit()
    }
    
}
