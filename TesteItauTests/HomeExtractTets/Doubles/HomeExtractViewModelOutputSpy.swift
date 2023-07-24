//
//  HomeExtractViewModelOutputSpy.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import Foundation
@testable import TesteItau

class HomeExtractViewModelOutputSpy: HomeExtractViewModelOutput {
    
    private(set) var checkFuncOnFailure: Bool = false
    private(set) var checkFuncOnListExtract: Bool = false
    
    func onFailure(error: ServiceManagerExtractError) {
        checkFuncOnFailure = true
        print(checkFuncOnFailure)
    }
    
    func onListExtract(list: [Receipts]) {
        checkFuncOnListExtract = true
    }
}
