//
//  ErrorExtractViewModelOutputSpy.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import Foundation
@testable import TesteItau

final class ErrorExtractViewModelOutputSpy: ErrorExtractViewModelOutput {
    
    private(set) var checkCallFuncError: Bool = false
    private(set) var checkMessange: String = ""
    
    func typeError(error: String) {
        checkCallFuncError = true
        checkMessange = error
    }
}
