//
//  ExchangeListInteractorTests.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import XCTest
@testable import AnaCoin

class ExchangeListServiceMock: ExchangeListService {
    var shouldReturnError = false
    var exchangeListMock: [Exchange]?

    override func fetchExchangeList(completion: @escaping (Result<[Exchange], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "ErrorTest", code: 1, userInfo: nil)))
        } else if let exchanges = exchangeListMock {
            completion(.success(exchanges))
        } else {
            completion(.failure(NSError(domain: "ErrorTest", code: 2, userInfo: nil)))
        }
    }
}

class ExchangeListInteractorTests: XCTestCase {
    
    var interactor: ExchangeListInteractor!
    var serviceMock: ExchangeListServiceMock!

    override func setUp() {
        super.setUp()
        serviceMock = ExchangeListServiceMock()
        interactor = ExchangeListInteractor(exchangeListService: serviceMock)
    }

    override func tearDown() {
        interactor = nil
        serviceMock = nil
        super.tearDown()
    }
    
    func testFetchExchangeListSuccess() {
        let mockExchanges: [Exchange] = [
            Exchange(
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
            ),
            Exchange(
                id: "BITSTAMP",
                name: "Bitstamp ltd.",
                website: "https://www.bitstamp.net/",
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
        ]
        serviceMock.exchangeListMock = mockExchanges
        
        let expectation = self.expectation(description: "Fetch exchange list with success")
        
        interactor.fetchExchangeList { result in
            switch result {
            case .success(let exchanges):
                XCTAssertEqual(exchanges.count, 2)
                XCTAssertEqual(exchanges.first?.name, "Binance")
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success, but failed")
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testFetchExchangeListFailure() {
        serviceMock.shouldReturnError = true

        let expectation = self.expectation(description: "Fetch exchange list failure")

        interactor.fetchExchangeList { result in
            switch result {
            case .success:
                XCTFail("Expected failure, but was success")
            case .failure(let error):
                XCTAssertEqual((error as NSError).domain, "ErrorTest")
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 1, handler: nil)
    }
}
