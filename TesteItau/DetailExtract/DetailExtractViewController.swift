//
//  DetailExtractViewController.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import UIKit

final class DetailExtractViewController: UIViewController {
    
    // MARK: - Properties
    
    private let detailExtractView = DetailExtractView()
    private var detailExtractViewModel: DetailExtractViewModelInput
    
    init(detailExtractViewModel: DetailExtractViewModelInput) {
        self.detailExtractViewModel = detailExtractViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailExtractView
    }
    
    // MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes do Extratos"
        detailExtractViewModel.delegate = self
        detailExtractViewModel.fecthDataDetail()
    }
}

// MARK: - DetailExtractViewModelOutput

extension DetailExtractViewController: DetailExtractViewModelOutput {
    func onListDetail(detail: Receipts) {
        detailExtractView.setupData(data: detail)
    }
}
