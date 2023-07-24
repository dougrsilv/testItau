//
//  HomeExtractViewModelTests.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 24/07/23.
//

import XCTest
@testable import TesteItau

final class HomeExtractViewModelTests: XCTestCase {
    
    func test_call_api_error() {
        let mock = MockServiceManagerExtract()
        lazy var homeExtractViewModel = HomeExtractViewModel(service: mock)
        let spy = HomeExtractViewModelOutputSpy()
        mock.result = .failure(.decodedError)
        homeExtractViewModel.delegate = spy
        homeExtractViewModel.fetchListExtract()
        
        wait(for:  [XCTestExpectation.init()], timeout: 30)

        XCTAssertTrue(spy.checkFuncOnFailure)
    }

}
