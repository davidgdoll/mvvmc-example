//
//  StoreViewController.swift
//  MVVMC
//
//  Created by David Doll on 04/05/19.
//  Copyright © 2019 David Doll. All rights reserved.
//

import UIKit

final class StoreViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero)
    private var viewModel: StoreViewModelProtocol
    
    init(viewModel: StoreViewModelProtocol) {
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
        viewModel.onViewDidLoad()
    }
    
    func setupUI() {
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = .white
    }
    
    func layoutUI() {
        title = viewModel.viewTitle
        tableView.frame = view.frame
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func bindViewModel() {
        viewModel.onProductsUpdated = {
            self.tableView.reloadData()
        }
    }
}

extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfProducts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.cellIdentifier, for: indexPath) as? ProductCell else { fatalError() }
        let product = viewModel.product(for: indexPath.row)
        cell.configure(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.presentProduct(for: indexPath.row)
    }
}
