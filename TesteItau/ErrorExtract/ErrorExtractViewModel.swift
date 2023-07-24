//
//  ErrorExtractViewModel.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import Foundation

protocol ErrorExtractViewModelInput {
    var delegate: ErrorExtractViewModelOutput? { get set }
    func fetctchData()
}

protocol ErrorExtractViewModelOutput: AnyObject {
    func typeError(error: String)
}

final class ErrorExtractViewModel: ErrorExtractViewModelInput {
    
    weak var delegate: ErrorExtractViewModelOutput?
    
    private let typeError: ServiceManagerExtractError
    
    init(typeError: ServiceManagerExtractError) {
        self.typeError = typeError
    }
    
    func fetctchData() {
        switch typeError {
        case .decodedError:
            delegate?.typeError(error: "Erro ao decodificar")
        case .network:
            delegate?.typeError(error: "Sem conexão com a internet")
        }
    }
}
