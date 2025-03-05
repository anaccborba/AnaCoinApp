//
//  ErrorViewSnapshotTests.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 04/03/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import AnaCoin

final class ErrorViewSnapshotTests: XCTestCase {

    func testErrorViewSnapshot() {
        let mockInteractor = ErrorInteractorMock()
        let presenter = ErrorPresenter(interactor: mockInteractor, message: "Error Message")
        let errorView = ErrorView(presenter: presenter).frame(width: 375, height: 667)
        
        assertSnapshot(of: errorView, as: .image)
    }
}
