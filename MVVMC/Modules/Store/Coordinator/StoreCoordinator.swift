//
//  StoreCoordinator.swift
//  MVVMC
//
//  Created by David Doll on 04/05/19.
//  Copyright © 2019 David Doll. All rights reserved.
//

import UIKit

protocol StoreCoordinatorProtocol: class {
    func presentProduct(product: Product)
}

final class StoreCoordinator {
    
    weak var navigationController: UINavigationController?
    
    func initModule() -> UINavigationController {
        let storeViewModel = StoreViewModel(coordinator: self)
        let storeController = StoreViewController(viewModel: storeViewModel)
        let navigationController = UINavigationController(rootViewController: storeController)
        self.navigationController = navigationController
        return navigationController
    }
}

extension StoreCoordinator: StoreCoordinatorProtocol {

    func presentProduct(product: Product) {
        let vc = ProductCoordinator().initModule(with: product, navigationController: navigationController)
        navigationController?.pushViewController(vc, animated: true)
    }
}
