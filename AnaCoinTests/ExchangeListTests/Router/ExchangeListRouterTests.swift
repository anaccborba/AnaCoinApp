//
//  ExchangeListRouterTests.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import XCTest
import SwiftUI
@testable import AnaCoin

class ExchangeListRouterTests: XCTestCase {

    func testStart() {
        let view = ExchangeListRouter.start()
        
        XCTAssertNotNil(view)
    }

    func testShowErrorView() {

        let errorMessage = "Error Message"
        let retryAction: () -> Void = {}
        let view = ExchangeListRouter().showErrorView(message: errorMessage, retryAction: retryAction)
        
        XCTAssertNotNil(view)
    }
}
