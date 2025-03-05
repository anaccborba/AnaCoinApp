//
//  ErrorInteractorTests.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 04/03/25.
//

import XCTest
@testable import AnaCoin

final class ErrorInteractorTests: XCTestCase {
    
    func testHandleRetryCallsRetryAction() {
        
        var isRetryCalled = false
        let interactor = ErrorInteractor {
            isRetryCalled = true
        }
        
        interactor.handleRetry()
        
        XCTAssertTrue(isRetryCalled)
    }
}
