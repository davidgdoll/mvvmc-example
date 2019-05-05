//
//  AppDelegate.swift
//  MVVMC
//
//  Created by David Doll on 04/05/19.
//  Copyright © 2019 David Doll. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootCoordinator: RootCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootModule()
        return true
    }
    
    func setupRootModule() {
        window = UIWindow(frame: UIScreen.main.bounds)
        rootCoordinator = RootCoordinator(window: window)
        rootCoordinator?.presentStore()
    }
}

