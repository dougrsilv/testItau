//
//  DetailExtractViewControllerTests.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import XCTest
@testable import TesteItau

final class DetailExtractViewControllerTests: XCTestCase {
    
    func test_call_viewDidLoad_viewController() {
        let viewModel = DetailExtractViewModelInputSpy()
        lazy var viewContoller = DetailExtractViewController(detailExtractViewModel: viewModel)
        viewContoller.viewDidLoad()
        XCTAssertTrue(viewModel.checkCallFecthDataDetail)
    }

}
