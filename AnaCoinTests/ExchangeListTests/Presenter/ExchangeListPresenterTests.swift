//
//  ExchangeListPresenterTests.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import XCTest
@testable import AnaCoin

class ExchangeListInteractorMock: ExchangeListInteractor {
    var resultToReturn: Result<[Exchange], Error>?
    
    override func fetchExchangeList(completion: @escaping (Result<[Exchange], Error>) -> Void) {
        if let result = resultToReturn {
            completion(result)
        }
    }
}

class ExchangeListRouterMock: ExchangeListRouter {
    override func showErrorView(message: String, retryAction: @escaping () -> Void) -> ErrorView {
        return ErrorView(presenter: ErrorPresenter(interactor: ErrorInteractor(retryAction: {}), message: message))
    }
}

class ExchangeListPresenterTests: XCTestCase {
    
    var presenter: ExchangeListPresenter!
    var interactorMock: ExchangeListInteractorMock!
    var routerMock: ExchangeListRouterMock!
    
    override func setUp() {
        super.setUp()
        
        interactorMock = ExchangeListInteractorMock()
        routerMock = ExchangeListRouterMock()
        presenter = ExchangeListPresenter(interactor: interactorMock, router: routerMock)
    }

    override func tearDown() {
        presenter = nil
        interactorMock = nil
        routerMock = nil
        super.tearDown()
    }
    
    func testInitialState_ShouldBeLoading() {
        XCTAssertEqual(presenter.state, .loading)
    }
    
    func testLoadDataSuccess() {
        let exchanges = [Exchange(
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
        )]
        
        interactorMock.resultToReturn = .success(exchanges)
        presenter.viewDidLoad()
        
        let expectation = self.expectation(description: "Expecting loaded state")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(self.presenter.state, .loaded(exchanges))
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testLoadDataFailure() {
        interactorMock.resultToReturn = .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Network error"]))
        presenter.viewDidLoad()
        
        let expectation = self.expectation(description: "Expecting error state")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if case .error(let message) = self.presenter.state {
                XCTAssertEqual(message, "Network error")
            } else {
                XCTFail("Expected error state")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testShowErrorView() {
        let errorMessage = "Test Error"
        let errorView = presenter.showError(message: errorMessage)
        
        XCTAssertEqual(errorView.presenter.message, errorMessage)
    }
}
