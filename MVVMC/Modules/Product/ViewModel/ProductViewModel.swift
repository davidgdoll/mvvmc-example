//
//  StoreViewModel.swift
//  MVVMC
//
//  Created by David Doll on 04/05/19.
//  Copyright © 2019 David Doll. All rights reserved.
//

import Foundation

protocol ProductViewModelProtocol {
    var productName: String {get}
    var viewTitle: String {get}
}

final class ProductViewModel {
    
    private let coordinator: ProductCoordinator
    private var product: Product
    
    init(coordinator: ProductCoordinator, product: Product) {
        self.coordinator = coordinator
        self.product = product
    }
}

extension ProductViewModel: ProductViewModelProtocol {
    
    var productName: String {
        return product.name
    }
    
    var viewTitle: String {
        return "Product"
    }
}
