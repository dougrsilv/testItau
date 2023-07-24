//
//  DetailExtractViewModelOutputSpy.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import Foundation
@testable import TesteItau

final class DetailExtractViewModelOutputSpy: DetailExtractViewModelOutput {
    
    private(set) var checkOnListDetail: Bool = false
    private(set) var title: String = ""
    private(set) var receiptId: String = ""
    private(set) var name: String = ""
    private(set) var receiverName: String = ""
    private(set) var amount: String = ""
    private(set) var control: String = ""
    private(set) var date: String = ""
    
    func onListDetail(detail: Receipts) {
        checkOnListDetail = true
        self.title = detail.title
        self.receiptId = detail.receiptId
        self.name = detail.name
        self.receiverName = detail.receiverName
        self.amount = detail.amount
        self.control = detail.control
        self.date = detail.date
    }
}
