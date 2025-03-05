//
//  ExchangeListViewSnapshotTests.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 04/03/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import AnaCoin

class ExchangeListViewTests: XCTestCase {
    var presenter: ExchangeListPresenter!
    var interactor: ExchangeListInteractorMock!
    var router: ExchangeListRouter!
    
    override func setUp() {
        super.setUp()
        interactor = ExchangeListInteractorMock()
        router = ExchangeListRouter() 
        presenter = ExchangeListPresenter(interactor: interactor, router: router)
    }

    override func tearDown() {
        presenter = nil
        interactor = nil
        router = nil
        super.tearDown()
    }

    func testExchangeListViewLoadingState() {
        presenter.state = .loading
        let view = ExchangeListView(presenter: self.presenter)

        assertSnapshot(of: view, as: .image, named: "loading_state")
    }

    func testExchangeListViewErrorState() {
        presenter.state = .error("Failed to load exchanges")
        let view = ExchangeListView(presenter: self.presenter)

        assertSnapshot(of: view, as: .image, named: "error_state")
    }

    func testExchangeListViewLoadedState() {
        let mockExchanges = [
            Exchange(id: "1", name: "Binance", website: "https://binance.com", dataQuoteStart: nil, dataQuoteEnd: nil, dataOrderbookStart: nil, dataOrderbookEnd: nil, dataTradeStart: nil, dataTradeEnd: nil, dataSymbolsCount: 100, volume1hrsUsd: 50000, volume1dayUsd: 1000000, volume1mthUsd: 30000000, rank: 1),
            Exchange(id: "2", name: "Coinbase", website: "https://coinbase.com", dataQuoteStart: nil, dataQuoteEnd: nil, dataOrderbookStart: nil, dataOrderbookEnd: nil, dataTradeStart: nil, dataTradeEnd: nil, dataSymbolsCount: 50, volume1hrsUsd: 20000, volume1dayUsd: 500000, volume1mthUsd: 15000000, rank: 2)
        ]
        interactor.resultToReturn = .success(mockExchanges)
        presenter.state = .loaded(mockExchanges)
        
        let view = ExchangeListView(presenter: self.presenter)
        
        assertSnapshot(of: view, as: .image, named: "loaded_state")
    }
}
