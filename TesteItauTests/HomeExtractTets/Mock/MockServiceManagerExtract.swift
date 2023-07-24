//
//  MockServiceManagerExtract.swift
//  TesteItauTests
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import Foundation
@testable import TesteItau

final class MockServiceManagerExtract: ServiceManagerExtractProtocol {
    
    var result: Result<ModelExtract, ServiceManagerExtractError>!
    
    func searchExtract(completion: @escaping (Result<ModelExtract, ServiceManagerExtractError>) -> ()) {
        completion(result)
    }
    
    func readLocalJsonFile() -> Data? {
        do {
            guard let fileUrl = Bundle.main.url(forResource: "ExtractMock", withExtension: "json") else { return nil }
            let data = try Data(contentsOf: fileUrl)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
