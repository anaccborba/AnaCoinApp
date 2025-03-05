//
//  ExchangeListPresenter.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import SwiftUI

enum ExchangeListState: Equatable {
    case loading
    case loaded([Exchange])
    case error(String)
    
    static func == (lhs: ExchangeListState, rhs: ExchangeListState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.loaded(let lhsExchanges), .loaded(let rhsExchanges)):
            return lhsExchanges == rhsExchanges
        case (.error(let lhsMessage), .error(let rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
}

class ExchangeListPresenter: ObservableObject {
    @Published var state: ExchangeListState = .loading
    private let interactor: ExchangeListInteractor
    private let router: ExchangeListRouter
    
    init(interactor: ExchangeListInteractor, router: ExchangeListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        loadData()
    }
    
    func refreshData() {
        loadData()
    }
    
    func showError(message: String) -> ErrorView {
        return router.showErrorView(message: message, retryAction: loadData)
    }
    
    private func loadData() {
        state = .loading
        interactor.fetchExchangeList { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let exchanges):
                    self.state = .loaded(exchanges)
                case .failure(let error):
                    self.state = .error(error.localizedDescription)
                }
            }
        }
    }

}

//Mock será usava para o launch dos Testes de UI
#if DEBUG
class MockExchangeListPresenter: ExchangeListPresenter {
    var mockState: ExchangeListState = .loading
    
    override var state: ExchangeListState {
        get {
            return mockState
        }
        set {
            mockState = newValue
        }
    }
    
    override init(interactor: ExchangeListInteractor, router: ExchangeListRouter) {
        super.init(interactor: interactor, router: router)
        
        if let mockStateEnvironment = ProcessInfo.processInfo.environment["MockExchangeList"] {
            switch mockStateEnvironment {
            case "loaded":
                mockState = .loaded([
                    Exchange(id: "BINANCE", name: "Binance", website: "http://binance.com", dataQuoteStart: nil, dataQuoteEnd: nil, dataOrderbookStart: nil, dataOrderbookEnd: nil, dataTradeStart: nil, dataTradeEnd: nil, dataSymbolsCount: 10, volume1hrsUsd: 1000, volume1dayUsd: 22000000000, volume1mthUsd: 600000, rank: 5),
                    Exchange(id: "KRAKEN", name: "Kraken", website: "http://binance.com", dataQuoteStart: nil, dataQuoteEnd: nil, dataOrderbookStart: nil, dataOrderbookEnd: nil, dataTradeStart: nil, dataTradeEnd: nil, dataSymbolsCount: 10, volume1hrsUsd: 1000, volume1dayUsd: 22000000000, volume1mthUsd: 600000, rank: 5)
                ])
            case "error":
                mockState = .error("Mock Error")
            default:
                mockState = .loading
            }
        } else {
            mockState = .loading
        }
    }
    
    override func viewDidLoad() {}
    override func refreshData() {}
    override func showError(message: String) -> ErrorView {
        let interactor = ErrorInteractor {}
        let presenter = ErrorPresenter(interactor: interactor, message: LocalizedStrings.errorLoadingData)
        
        return ErrorView(presenter: presenter)
    }
}
#endif
