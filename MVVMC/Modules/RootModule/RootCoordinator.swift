//
//  RootModule.swift
//  MVVMC
//
//  Created by David Doll on 04/05/19.
//  Copyright © 2019 David Doll. All rights reserved.
//

import UIKit

final class RootCoordinator {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func presentStore() {
        window?.rootViewController = StoreCoordinator().initModule()
        window?.makeKeyAndVisible()
    }
}
