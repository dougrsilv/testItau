//
//  HomeExtractViewController.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 21/07/23.
//

import UIKit

final class HomeExtractViewController: UIViewController {
    
    // MARK: - Properties
    
    private let homeExtractView = HomeExtractView()
    private var homeExtractViewModel: HomeExtractViewModelInput
    
    override func loadView() {
        view = homeExtractView
    }
    
    init(homeExtractViewModel: HomeExtractViewModelInput) {
        self.homeExtractViewModel = homeExtractViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Extrato"
        homeExtractViewModel.delegate = self
        homeExtractViewModel.fetchListExtract()
        homeExtractView.delegate = self
    }
}

// MARK: - HomeExtractViewModelOutput

extension HomeExtractViewController: HomeExtractViewModelOutput {
    func onFailure(error: ServiceManagerExtractError) {
        homeExtractViewModel.naviagtionErrorExtract(error: error, delegate: self)
    }
    
    func onListExtract(list: [Receipts]) {
        homeExtractView.setupData(data: list)
    }
}

// MARK: - HomeExtractViewDelegate

extension HomeExtractViewController: HomeExtractViewDelegate {
    func clickExtract(data: Receipts) {
        homeExtractViewModel.navigationDetailExtract(data: data)
    }
}

// MARK: - ErrorExtractViewControllerDelegate

extension HomeExtractViewController: ErrorExtractViewControllerDelegate {
    func loadingSerivceErrorExtractViewController(bool: Bool) {
        super.viewWillAppear(bool)
        self.tabBarController?.tabBar.isHidden = false
        homeExtractViewModel.delegate = self
        homeExtractViewModel.fetchListExtract()
        homeExtractView.delegate = self
    }
}
