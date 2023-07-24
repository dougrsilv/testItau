//
//  ServicesExtract.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 22/07/23.
//

import Foundation

enum ServicesExtractError: Error {
    case decodedError
    case network(Error?)
}

protocol ServicesExtractProtocol {
    func searchServices(completion: @escaping(Result<ModelExtract, ServicesExtractError>) -> ())
}

class ServicesExtractService: ServicesExtractProtocol {
    func searchServices(completion: @escaping (Result<ModelExtract, ServicesExtractError>) -> ()) {
        let fileName = "Extract"
        let fileType = "json"
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileType) else { return }
        
        do {
            let data = try Data(contentsOf: URL(filePath: path) , options: .mappedIfSafe)
            let service = try JSONDecoder().decode(ModelExtract.self, from: data)
            completion(.success(service))
        } catch {
            completion(.failure(.decodedError))
            return
        }
    }
}
