//
//  ErrorExtractViewControllerTests.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import XCTest
@testable import TesteItau

final class ErrorExtractViewControllerTests: XCTestCase {
    
    func test_call_viewDidLoad_viewController() {
        let viewModel = ErrorExtractViewModelInputSpy()
        lazy var viewController = ErrorExtractViewController(errorExtractViewModel: viewModel)
        viewController.viewDidLoad()
        XCTAssertTrue(viewModel.checkCallViewDidLoad)
    }
}
