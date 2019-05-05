//
//  StoreViewModel.swift
//  MVVMC
//
//  Created by David Doll on 04/05/19.
//  Copyright © 2019 David Doll. All rights reserved.
//

import Foundation

protocol StoreViewModelProtocol {
    func onViewDidLoad()
    func presentProduct(for index: Int)
    func product(for index: Int) -> Product
    var numberOfProducts: Int {get}
    var onProductsUpdated: () -> Void {get set}
    var viewTitle: String {get}
}

final class StoreViewModel {
    
    private let coordinator: StoreCoordinatorProtocol
    private var products: [Product] = [] {
        didSet {
            onProductsUpdated()
        }
    }

    init(coordinator: StoreCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    var onProductsUpdated: () -> Void = {}
}

extension StoreViewModel: StoreViewModelProtocol {
    
    func onViewDidLoad() {
        fetchProducts()
    }
    
    func fetchProducts() {
        products = [Product(name: "🍙 Sushi"),
                    Product(name: "💎 Diamond"),
                    Product(name: "🎧 Headphones"),
                    Product(name: "👗 Dress"),
                    Product(name: "🧦 Socks"),
                    Product(name: "💍 Ring"),
                    Product(name: "🖥 iMac")]
    }
    
    func product(for index: Int) -> Product {
        return products[index]
    }
    
    var numberOfProducts: Int {
        return products.count
    }
    
    var viewTitle: String {
        return "Store"
    }
    
    func presentProduct(for index: Int) {
        coordinator.presentProduct(product: products[index])
    }
}
