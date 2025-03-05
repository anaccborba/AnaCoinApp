//
//  ExchangeDetailRouter.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import SwiftUI

class ExchangeDetailRouter {
    static func start(exchange: Exchange) -> ExchangeDetailView {
        let interactor = ExchangeDetailInteractor(exchange: exchange)
        let presenter = ExchangeDetailPresenter(interactor: interactor)
        
        return ExchangeDetailView(presenter: presenter)
    }
}
