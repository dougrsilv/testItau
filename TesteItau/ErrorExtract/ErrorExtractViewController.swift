//
//  ErrorExtractViewController.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import UIKit

protocol ErrorExtractViewControllerDelegate: AnyObject {
    func loadingSerivceErrorExtractViewController(bool: Bool)
}

final class ErrorExtractViewController: UIViewController {
    
    // MARK: - Properties
    
    let errorExtractView = ErrorExtractView()
    weak var delegate: ErrorExtractViewControllerDelegate?
    private var errorExtractViewModel: ErrorExtractViewModelInput
    
    override func loadView() {
        view = errorExtractView
    }
    
    init(errorExtractViewModel: ErrorExtractViewModelInput) {
        self.errorExtractViewModel = errorExtractViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorExtractViewModel.delegate = self
        errorExtractViewModel.fetctchData()
        errorExtractView.delegate = self
    }
}

// MARK: - ErrorExtractViewDelegate

extension ErrorExtractViewController: ErrorExtractViewDelegate {
    func clickButtonUpdateErrorView() {
        delegate?.loadingSerivceErrorExtractViewController(bool: true)
        dismiss(animated: true)
    }
}

// MARK: - ErrorExtractViewModelOutput

extension ErrorExtractViewController: ErrorExtractViewModelOutput {
    func typeError(error: String) {
        errorExtractView.setupData(data: error)
    }
}


