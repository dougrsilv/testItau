//
//  HomeExtractViewModelInputSpy.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 24/07/23.
//

import Foundation
@testable import TesteItau

final class HomeExtractViewModelInputSpy: HomeExtractViewModelInput {
    var delegate: TesteItau.HomeExtractViewModelOutput?
    
    private(set) var checkCallFuncExtract: Bool = false
    private(set) var checkCallFuncNavigationDetailExtract: Bool = false
    private(set) var checkCallFuncNavigationErrorExtract: Bool = false
    
    func fetchListExtract() {
        checkCallFuncExtract = true
    }
    
    func navigationDetailExtract(data: Receipts) {
        checkCallFuncNavigationDetailExtract = true
    }
    
    func naviagtionErrorExtract(error: ServiceManagerExtractError, delegate: ErrorExtractViewControllerDelegate) {
        checkCallFuncNavigationErrorExtract = true
    }
}
