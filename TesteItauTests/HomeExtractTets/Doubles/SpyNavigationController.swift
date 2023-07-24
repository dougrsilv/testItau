//
//  SpyNavigationController.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 24/07/23.
//

import UIKit

final class SpyNavigationController: UINavigationController {
    
    var pushViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
}

