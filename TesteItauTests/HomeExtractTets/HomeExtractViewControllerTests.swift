//
//  HomeExtractViewControllerTests.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 24/07/23.
//

import XCTest
@testable import TesteItau

final class HomeExtractViewControllerTests: XCTestCase {
    
    func test_call_viewDidLoad_viewController() {
        let spy = HomeExtractViewModelInputSpy()
        lazy var sut = HomeExtractViewController(homeExtractViewModel: spy)
        sut.viewDidLoad()
        
        XCTAssertTrue(spy.checkCallFuncExtract)
    }
    
    func test_call_check_funcclickExtract() {
        let receipts = Receipts(title: "",
                                receiptId: "",
                                name: "",
                                receiverName: "",
                                amount: "",
                                control: "",
                                date: "")
        
        let spy = HomeExtractViewModelInputSpy()
        lazy var sut = HomeExtractViewController(homeExtractViewModel: spy)
        sut.clickExtract(data: receipts)
        
        XCTAssertTrue(spy.checkCallFuncNavigationDetailExtract)
    }
    
    func test_call_check_funcnavigationrrrorrxtract() {
        let spy = HomeExtractViewModelInputSpy()
        lazy var sut = HomeExtractViewController(homeExtractViewModel: spy)
        sut.onFailure(error: .decodedError)
        
        XCTAssertTrue(spy.checkCallFuncNavigationErrorExtract)
    }
    
    func test_navigation_detailExtract() {
        let receipts = Receipts(title: "",
                                receiptId: "",
                                name: "",
                                receiverName: "",
                                amount: "",
                                control: "",
                                date: "")
        let viewModel = HomeExtractViewModel(service: ServiceManagerExtract())
        lazy var sut = HomeExtractViewController(homeExtractViewModel: viewModel)
        let spy = SpyNavigationController(rootViewController: sut)
        let coordinator = HomeExtractCoordinator(navigationController: spy)
        coordinator.startDetailExtract(data: receipts)
        
        XCTAssertTrue(spy.pushViewController is DetailExtractViewController)
    }
    
    func test_naviagtion_errorextract() {
        let homeExtractSpy = HomeExtractViewModelInputSpy()
        let homeExtract = HomeExtractViewController(homeExtractViewModel: homeExtractSpy)
        let viewModel = HomeExtractViewModel(service: ServiceManagerExtract())
        lazy var sut = HomeExtractViewController(homeExtractViewModel: viewModel)
        let spy = SpyPresentNavigationController(rootViewController: sut)
        let coordinator = HomeExtractCoordinator(navigationController: spy)
        coordinator.startErrorExtract(typeError: .decodedError, delegate: homeExtract.self)
        
        XCTAssertTrue(spy.pesentViewController is ErrorExtractViewController)
    }

}
