//
//  HomeExtractViewModel.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 22/07/23.
//

import Foundation

protocol HomeExtractViewModelInput {
    var delegate: HomeExtractViewModelOutput? { get set }
    func fetchListExtract()
    func navigationDetailExtract(data: Receipts)
    func naviagtionErrorExtract(error: ServiceManagerExtractError, delegate: ErrorExtractViewControllerDelegate)
}

protocol HomeExtractViewModelOutput: AnyObject {
    func onFailure(error: ServiceManagerExtractError)
    func onListExtract(list: [Receipts])
}

final class HomeExtractViewModel: HomeExtractViewModelInput {
    
    private let service: ServiceManagerExtractProtocol
    weak var delegate: HomeExtractViewModelOutput?
    var coordinator: HomeExtractCoordinator?
    
    init(service: ServiceManagerExtractProtocol) {
        self.service = service
    }
    
    func fetchListExtract() {
        service.searchExtract { [weak self] service in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch service {
                case let .failure(error):
                    self.delegate?.onFailure(error: error)
                case let .success(success):
                    self.delegate?.onListExtract(list: success.data.receipts)
                }
            }
        }
    }
    
    func navigationDetailExtract(data: Receipts) {
        coordinator?.startDetailExtract(data: data)
    }
    
    func naviagtionErrorExtract(error: ServiceManagerExtractError, delegate: ErrorExtractViewControllerDelegate) {
        coordinator?.startErrorExtract(typeError: error, delegate: delegate)
    }
}
