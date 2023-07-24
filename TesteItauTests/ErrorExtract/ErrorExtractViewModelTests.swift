//
//  ErrorExtractViewModelTests.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import XCTest
@testable import TesteItau

final class ErrorExtractViewModelTests: XCTestCase {
    
    func test_check_call_func() {
        let sut = ErrorExtractViewModel(typeError: ServiceManagerExtractError.decodedError)
        let spy = ErrorExtractViewModelOutputSpy()
        sut.delegate = spy
        sut.fetctchData()
        
        XCTAssertTrue(spy.checkCallFuncError)
    }
    
    func test_message_decodedError() {
        let sut = ErrorExtractViewModel(typeError: ServiceManagerExtractError.decodedError)
        let spy = ErrorExtractViewModelOutputSpy()
        sut.delegate = spy
        sut.fetctchData()
        
        XCTAssertTrue(spy.checkMessange == "Erro ao decodificar")
    }
    
    func test_message_() {
        let sut = ErrorExtractViewModel(typeError: ServiceManagerExtractError.network(.none))
        let spy = ErrorExtractViewModelOutputSpy()
        sut.delegate = spy
        sut.fetctchData()
        
        XCTAssertTrue(spy.checkMessange ==  "Sem conexão com a internet")
    }
}
