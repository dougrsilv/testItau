//
//  DetailExtractCoordinator.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import UIKit

final class DetailExtractCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let data: Receipts
    
    init(navigationController: UINavigationController, data: Receipts) {
        self.navigationController = navigationController
        self.data = data
    }
    
    func start() {
        let detailExtractViewModel = DetailExtractViewModel(receipts: data)
        let detailExtractViewController = DetailExtractViewController(detailExtractViewModel: detailExtractViewModel)
        navigationController.pushViewController(detailExtractViewController, animated: true)
    }
}
