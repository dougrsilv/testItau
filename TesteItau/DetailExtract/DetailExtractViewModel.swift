//
//  DetailExtractViewModel.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import Foundation

protocol DetailExtractViewModelInput {
    var delegate: DetailExtractViewModelOutput? { get set }
    func fecthDataDetail()
}

protocol DetailExtractViewModelOutput: AnyObject {
    func onListDetail(detail: Receipts)
}

final class DetailExtractViewModel: DetailExtractViewModelInput {
    
    var delegate: DetailExtractViewModelOutput?
    private let receipts: Receipts
    
    init(receipts: Receipts) {
        self.receipts = receipts
    }
    
    func fecthDataDetail() {
        delegate?.onListDetail(detail: receipts)
    }
}
