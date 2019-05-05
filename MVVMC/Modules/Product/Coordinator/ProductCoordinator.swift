//
//  ProductCoordinator.swift
//  MVVMC
//
//  Created by David Doll on 04/05/19.
//  Copyright © 2019 David Doll. All rights reserved.
//

import UIKit

protocol ProductCoordinatorProtocol: class {
    func dismiss()
}

final class ProductCoordinator {
    
    weak var navigationController: UINavigationController?
    
    func initModule(with product: Product, navigationController: UINavigationController?) -> UIViewController {
        self.navigationController = navigationController
        let viewModel = ProductViewModel(coordinator: self, product: product)
        let vc = ProductViewController(viewModel: viewModel)
        return vc
    }
}

extension ProductCoordinator: ProductCoordinatorProtocol {
    
    func dismiss() {
        navigationController?.popViewController(animated: true)
    }
}
