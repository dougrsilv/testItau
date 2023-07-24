//
//  DetailExtractViewModelTests.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import XCTest
@testable import TesteItau

final class DetailExtractViewModelTests: XCTestCase {
    
    func test_check_call_func() {
        
        let receiptMock = Receipts(title: "Transferência",
                                   receiptId: "112312",
                                   name: "Débora dos Santos",
                                   receiverName: "João da Silva",
                                   amount: "R$ 5.000,00",
                                   control: "HDUS36217367127DS",
                                   date: "qua, 27 de abril de 2022")
        
        let sut = DetailExtractViewModel(receipts: receiptMock)
        let spy = DetailExtractViewModelOutputSpy()
        sut.delegate = spy
        sut.fecthDataDetail()
        
        XCTAssertTrue(spy.checkOnListDetail)
    }
    
    func test_check_data_model() {
        
        let receiptMock = Receipts(title: "Transferência",
                                   receiptId: "112312",
                                   name: "Débora dos Santos",
                                   receiverName: "João da Silva",
                                   amount: "R$ 5.000,00",
                                   control: "HDUS36217367127DS",
                                   date: "qua, 27 de abril de 2022")
        
        let sut = DetailExtractViewModel(receipts: receiptMock)
        let spy = DetailExtractViewModelOutputSpy()
        sut.delegate = spy
        sut.fecthDataDetail()
        
        XCTAssertTrue(receiptMock.title == spy.title)
        XCTAssertTrue(receiptMock.receiptId == spy.receiptId)
        XCTAssertTrue(receiptMock.name == spy.name)
        XCTAssertTrue(receiptMock.receiverName == spy.receiverName)
        XCTAssertTrue(receiptMock.amount == spy.amount)
        XCTAssertTrue(receiptMock.control == spy.control)
        XCTAssertTrue(receiptMock.date == spy.date)
    }
}
