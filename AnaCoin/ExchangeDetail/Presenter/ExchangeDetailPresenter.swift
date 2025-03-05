//
//  ExchangeDetailPresenter.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import Foundation

class ExchangeDetailPresenter: ObservableObject {
    @Published var exchange: Exchange
    
    init(interactor: ExchangeDetailInteractorProtocol) {
        self.exchange = interactor.exchange
    }
}
