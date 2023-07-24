//
//  AppCoordinator.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let homeExtractCoordinator = HomeExtractCoordinator(navigationController: navigationController)
        homeExtractCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
