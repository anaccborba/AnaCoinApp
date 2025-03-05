//
//  ExchangeListRouter.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import SwiftUI
import Foundation

class ExchangeListRouter {
    static func start() -> ExchangeListView {
        let interactor = ExchangeListInteractor()
        let router = ExchangeListRouter()
        
        if ProcessInfo.processInfo.arguments.contains("UITestMode") {
            let presenter = MockExchangeListPresenter(interactor: interactor, router: router)
            return ExchangeListView(presenter: presenter)
        } else {
            let presenter = ExchangeListPresenter(interactor: interactor, router: router)
            return ExchangeListView(presenter: presenter)
        }
    }
    
    func showErrorView(message: String, retryAction: @escaping () -> Void) -> ErrorView {
        let interactor = ErrorInteractor(retryAction: retryAction)
        let presenter = ErrorPresenter(interactor: interactor, message: message)
        
        return ErrorView(presenter: presenter)
    }
}
