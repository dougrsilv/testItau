//
//  DetailExtractViewModelInputSpy.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import Foundation
@testable import TesteItau

final class DetailExtractViewModelInputSpy: DetailExtractViewModelInput {
    
    var delegate: DetailExtractViewModelOutput?
    private(set) var checkCallFecthDataDetail: Bool = false
    
    func fecthDataDetail() {
        checkCallFecthDataDetail = true
    }
}
