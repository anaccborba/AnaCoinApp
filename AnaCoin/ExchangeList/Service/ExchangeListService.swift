//
//  ExchangeListService.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import Alamofire
import Foundation
import os

enum ExchangeError: Error {
    case invalidResponse
    case decodingError
    case networkError(Error)
}

class ExchangeListService {

    private let baseURL = "https://rest.coinapi.io/v1/exchanges"
    private let apiKey = APIKeyManager().apiKey
    private let logger: Logger

    init() {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            fatalError("Bundle identifier is missing.")
        }
        self.logger = Logger(subsystem: bundleIdentifier, category: "ExchangeListService")
    }
    
    func fetchExchangeList(completion: @escaping (Result<[Exchange], Error>) -> Void) {
        
        guard !apiKey.isEmpty else {
            logger.error("API key not found")
            completion(.failure(ExchangeError.invalidResponse))
            return
        }

        let headers: HTTPHeaders = [
            "X-CoinAPI-Key": apiKey
        ]

        AF.request(baseURL, method: .get, headers: headers)
            .validate()
            .responseData { [weak self] response in
                guard let self = self else { return }

                if let data = response.data, let jsonString = String(data: data, encoding: .utf8) {
                    self.logger.info("API Response: \(jsonString)")
                }

                switch response.result {
                case .success:
                    self.handleSuccess(data: response.data, completion: completion)
                case .failure(let error):
                    self.handleError(error: error, completion: completion)
                }
            }
    }

    private func handleSuccess(data: Data?, completion: @escaping (Result<[Exchange], Error>) -> Void) {
        guard let data = data else {
            logger.error("API response is empty")
            completion(.failure(ExchangeError.invalidResponse))
            return
        }

        do {
            let exchanges = try JSONDecoder().decode([Exchange].self, from: data)
            completion(.success(exchanges))
        } catch {
            logger.error("Error to decode JSON: \(error.localizedDescription)")
            completion(.failure(ExchangeError.decodingError))
        }
    }

    private func handleError(error: Error, completion: @escaping (Result<[Exchange], Error>) -> Void) {
        logger.error("Network error: \(error.localizedDescription)")
        completion(.failure(ExchangeError.networkError(error)))
    }
}
