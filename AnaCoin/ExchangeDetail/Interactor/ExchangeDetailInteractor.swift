//
//  ExchangeDetailInteractor.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import Foundation

protocol ExchangeDetailInteractorProtocol {
    var exchange: Exchange { get }
}

class ExchangeDetailInteractor: ExchangeDetailInteractorProtocol {
    let exchange: Exchange
    
    init(exchange: Exchange) {
        self.exchange = exchange
    }
}
