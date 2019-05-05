//
//  ProductCell.swift
//  MVVMC
//
//  Created by David Doll on 04/05/19.
//  Copyright © 2019 David Doll. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    static let cellIdentifier = "ProductCellIdentifier"
    
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: Product) {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        textLabel?.text = product.name
    }
}
