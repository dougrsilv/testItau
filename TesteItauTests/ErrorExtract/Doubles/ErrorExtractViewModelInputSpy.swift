//
//  ErrorExtractViewModelInputSpy.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import Foundation
@testable import TesteItau

final class ErrorExtractViewModelInputSpy: ErrorExtractViewModelInput {
    var delegate: TesteItau.ErrorExtractViewModelOutput?
    private(set) var checkCallViewDidLoad: Bool = false
    
    func fetctchData() {
        checkCallViewDidLoad = true
    }
}
