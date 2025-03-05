//
//  ExchangeCellSnapshotTest.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import AnaCoin

class ExchangeCellSnapshotTests: XCTestCase {
    
    func testExchangeCellSnapshot() {
        let exchange = Exchange(id: "BINANCE", name: "Binance", website: "http://binance.com", dataQuoteStart: nil, dataQuoteEnd: nil, dataOrderbookStart: nil, dataOrderbookEnd: nil, dataTradeStart: nil, dataTradeEnd: nil, dataSymbolsCount: 10, volume1hrsUsd: 1000, volume1dayUsd: 22000000000, volume1mthUsd: 600000, rank: 5)
        
        let exchangeCell = ExchangeCell(exchange: exchange)
        let hostingController = UIHostingController(rootView: exchangeCell)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 100)
        
        assertSnapshot(of: hostingController, as: .image)
    }
    
    func testExchangeCellWithoutNameSnapshot() {
        let exchange = Exchange(id: "BINANCE", name: nil, website: "http://binance.com", dataQuoteStart: nil, dataQuoteEnd: nil, dataOrderbookStart: nil, dataOrderbookEnd: nil, dataTradeStart: nil, dataTradeEnd: nil, dataSymbolsCount: 10, volume1hrsUsd: 1000, volume1dayUsd: 22000000000, volume1mthUsd: 600000, rank: 5)
        
        let exchangeCell = ExchangeCell(exchange: exchange)
        let hostingController = UIHostingController(rootView: exchangeCell)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 100)
        
        assertSnapshot(of: hostingController, as: .image)
    }
    
    func testExchangeCellWithoutVolume1dayUsdSnapshot() {
        let exchange = Exchange(id: "BINANCE", name: nil, website: "http://binance.com", dataQuoteStart: nil, dataQuoteEnd: nil, dataOrderbookStart: nil, dataOrderbookEnd: nil, dataTradeStart: nil, dataTradeEnd: nil, dataSymbolsCount: 10, volume1hrsUsd: 1000, volume1dayUsd: nil, volume1mthUsd: 600000, rank: 5)
        
        let exchangeCell = ExchangeCell(exchange: exchange)
        let hostingController = UIHostingController(rootView: exchangeCell)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 100)
        
        assertSnapshot(of: hostingController, as: .image)
    }
}
