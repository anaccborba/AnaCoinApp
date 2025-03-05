//
//  ErrorPresenterTests.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 04/03/25.
//

import XCTest
@testable import AnaCoin


class ErrorInteractorMock: ErrorInteractorProtocol {
    var isHandleRetryCalled = false
    
    func handleRetry() {
        isHandleRetryCalled = true
    }
}

final class ErrorPresenterTests: XCTestCase {
    
    var interactorMock: ErrorInteractorMock!
    var presenter: ErrorPresenter!
    
    override func setUp() {
        super.setUp()
        interactorMock = ErrorInteractorMock()
        presenter = ErrorPresenter(interactor: interactorMock, message: "Error Message Test")
    }
    
    override func tearDown() {
        interactorMock = nil
        presenter = nil
        super.tearDown()
    }
    
    func testRetryCallsHandleRetry() {
        presenter.retry()
        XCTAssertTrue(interactorMock.isHandleRetryCalled)
    }
}
