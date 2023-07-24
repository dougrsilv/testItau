//
//  SpyPresentNavigationController.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 24/07/23.
//

import UIKit

final class SpyPresentNavigationController: UINavigationController {
    
    var pesentViewController: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        pesentViewController = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag)
    }
}


