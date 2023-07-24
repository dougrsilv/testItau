//
//  ModelExtract.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 22/07/23.
//

import Foundation

struct ModelExtract: Codable {
    let data: DataExtract
}

struct DataExtract: Codable {
    let receipts: [Receipts]
    let pagination: Pagination
}

struct Receipts: Codable {
    let title: String
    let receiptId: String
    let name: String
    let receiverName: String
    let amount: String
    let control: String
    let date: String
}

struct Pagination: Codable {
    let page: Int
    let pageSize: Int
    let totalElements: Int
    let totalPages: Int
}
