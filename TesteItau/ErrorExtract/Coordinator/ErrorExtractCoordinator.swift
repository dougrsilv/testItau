//
//  ErrorExtractCoordinator.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import UIKit

final class ErrorExtractCoordinator: Coordinator {
    
    private let navigatioController: UINavigationController
    private let typeError: ServiceManagerExtractError
    private let delegate: ErrorExtractViewControllerDelegate
    
    init(navigatioController: UINavigationController, typeError: ServiceManagerExtractError, delegate: ErrorExtractViewControllerDelegate) {
        self.navigatioController = navigatioController
        self.typeError = typeError
        self.delegate = delegate
    }
    
    func start() {
        let errorExtractViewModel = ErrorExtractViewModel(typeError: typeError)
        let errorExtractViewController = ErrorExtractViewController(errorExtractViewModel: errorExtractViewModel)
        errorExtractViewController.delegate = delegate
        errorExtractViewController.modalPresentationStyle = .fullScreen
        navigatioController.present(errorExtractViewController, animated: true)
    }
}
