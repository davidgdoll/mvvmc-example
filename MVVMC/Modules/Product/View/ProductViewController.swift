//
//  StoreViewController.swift
//  MVVMC
//
//  Created by David Doll on 04/05/19.
//  Copyright © 2019 David Doll. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController {

    private let groupNameLabel = UILabel(frame: .zero)
    private var viewModel: ProductViewModelProtocol
    
    init(viewModel: ProductViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        layoutUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        groupNameLabel.frame = view.frame
        groupNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        groupNameLabel.textAlignment = .center
        view.addSubview(groupNameLabel)
    }
    
    func layoutUI() {
        title = viewModel.viewTitle
        groupNameLabel.text = viewModel.productName
    }
}
