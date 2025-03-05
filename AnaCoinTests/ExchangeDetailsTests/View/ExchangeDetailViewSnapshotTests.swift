//
//  ExchangeDetailViewSnapshotTests.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import AnaCoin

class ExchangeDetailViewSnapshotTests: XCTestCase {

    func testExchangeDetailViewSnapshot() {
        let exchange = Exchange(
            id: "BINANCE",
            name: "Binance",
            website: "https://www.binance.com/",
            dataQuoteStart: "2017-12-18T00:00:00.0000000Z",
            dataQuoteEnd: "2025-03-03T00:00:00.0000000Z",
            dataOrderbookStart: "2017-12-18T00:00:00.0000000Z",
            dataOrderbookEnd: "2025-03-03T00:00:00.0000000Z",
            dataTradeStart: "2017-07-14T00:00:00.0000000Z",
            dataTradeEnd: "2025-02-24T00:00:00.0000000Z",
            dataSymbolsCount: 229,
            volume1hrsUsd: 604797270.95,
            volume1dayUsd: 21141942317.05,
            volume1mthUsd: 545107988842.43,
            rank: 2
        )
        
        let presenter = ExchangeDetailPresenter(interactor: ExchangeDetailInteractor(exchange: exchange))
        let view = ExchangeDetailView(presenter: presenter).frame(width: 375, height: 667)

        assertSnapshot(of: view, as: .image)
    }
}
