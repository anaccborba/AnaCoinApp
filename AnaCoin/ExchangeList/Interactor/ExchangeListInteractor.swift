//
//  ExchangeListInteractor.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import Foundation

protocol ExchangeListInteractorProtocol {
    func fetchExchangeList(completion: @escaping (Result<[Exchange], Error>) -> Void)
}

class ExchangeListInteractor: ExchangeListInteractorProtocol {
    private let service: ExchangeListService
    
    init(exchangeListService: ExchangeListService = ExchangeListService()) {
        self.service = exchangeListService
    }
    
    func fetchExchangeList(completion: @escaping (Result<[Exchange], Error>) -> Void) {
        service.fetchExchangeList { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
