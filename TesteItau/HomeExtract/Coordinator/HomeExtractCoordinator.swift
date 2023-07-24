//
//  HomeExtractCoordinator.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import UIKit

final class HomeExtractCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let serviceManagerExtract = ServiceManagerExtract()
        let homeExtractViewModel = HomeExtractViewModel(service: serviceManagerExtract)
        let homeExtractViewController = HomeExtractViewController(homeExtractViewModel: homeExtractViewModel)
        homeExtractViewModel.coordinator = self
        navigationController.setViewControllers([homeExtractViewController], animated: false)
    }
    
    func startDetailExtract(data: Receipts) {
        let detailExtractCoordinator = DetailExtractCoordinator(navigationController: navigationController, data: data)
        detailExtractCoordinator.start()
    }
    
    func startErrorExtract(typeError: ServiceManagerExtractError, delegate: ErrorExtractViewControllerDelegate) {
        let errorExtractCoordinator = ErrorExtractCoordinator(navigatioController: navigationController, typeError: typeError, delegate: delegate)
        errorExtractCoordinator.start()
    }
}
