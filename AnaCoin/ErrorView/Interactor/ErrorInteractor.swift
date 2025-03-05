//
//  ErrorInteractor.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 04/03/25.
//

import Foundation

protocol ErrorInteractorProtocol {
    func handleRetry()
}

final class ErrorInteractor: ErrorInteractorProtocol {
    private let retryAction: () -> Void
    
    init(retryAction: @escaping () -> Void) {
        self.retryAction = retryAction
    }
    
    func handleRetry() {
        retryAction()
    }
}
