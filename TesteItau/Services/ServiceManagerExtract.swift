//
//  ServiceManagerExtract.swift
//  TesteItau
//
//  Created by Douglas  Rodrigues  on 23/07/23.
//

import Foundation

enum ServiceManagerExtractError: Error {
    case decodedError
    case network(Error?)
}

protocol ServiceManagerExtractProtocol {
    func searchExtract(completion: @escaping (Result<ModelExtract, ServiceManagerExtractError>) -> ())
}

final class ServiceManagerExtract: ServiceManagerExtractProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func searchExtract(completion: @escaping (Result<ModelExtract, ServiceManagerExtractError>) -> ()) {
        guard let url = URL(string: "http://localhost:3000/extract") else { return }
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.network(error)))
                return
            }
            
            do {
                guard let data = data else { return }
                let service = try JSONDecoder().decode(ModelExtract.self, from: data)
                completion(.success(service))
            } catch let err {
                completion(.failure(.decodedError))
                print(err)
                return
            }
        }.resume()
    }
}
