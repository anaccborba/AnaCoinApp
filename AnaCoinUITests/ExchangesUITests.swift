//
//  ExchangeListUITests.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 04/03/25.
//

import XCTest

final class ExchangesUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments.append("UITestMode")
    }
    
    func testSplashScreenAppears() {
        let app = XCUIApplication()
        app.launch()

        let animationView = app.otherElements["SplashAnimation"]
        
        XCTAssertTrue(animationView.waitForExistence(timeout: 3), "Splash Animation should be visible")
    }


    func testLoadingState() {
        app.launchEnvironment["MockExchangeList"] = "loading"
        app.launch()

        let loadingIndicator = app.activityIndicators["loadingIndicator"]
        XCTAssertTrue(loadingIndicator.waitForExistence(timeout: 5))
    }

    func testLoadedState() {
        app.launchEnvironment["MockExchangeList"] = "loaded"
        app.launch()

        let exchangeListCell = app.staticTexts["exchangeCell_BINANCE"]
        XCTAssertTrue(exchangeListCell.waitForExistence(timeout: 5), "At least on ExchangeCell should be visible")
    }
    
    func testOpenExchangeDetail() {
        app.launchEnvironment["MockExchangeList"] = "loaded"
        app.launch()

        let exchangeListCell = app.staticTexts["exchangeCell_BINANCE"]
        XCTAssertTrue(exchangeListCell.waitForExistence(timeout: 5), "At least one ExchangeCell should be visible")
        
        exchangeListCell.tap()
        
        let exchangeDetailTitle = app.staticTexts["exchangeDetailTitle"]
        XCTAssertTrue(exchangeDetailTitle.waitForExistence(timeout: 2), "ExchangeDetailView should be visible")
    }

    func testErrorState() {
        app.launchEnvironment["MockExchangeList"] = "error"
        app.launch()

        let errorAlert = app.staticTexts["Ocorreu um erro"]
        XCTAssertTrue(errorAlert.waitForExistence(timeout: 5))
    }
}
