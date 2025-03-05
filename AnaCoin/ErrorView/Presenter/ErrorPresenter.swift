//
//  ErrorPresenter.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 04/03/25.
//

import Foundation

protocol ErrorPresenterProtocol {
    var message: String { get }
    func retry()
}

final class ErrorPresenter: ObservableObject, ErrorPresenterProtocol {
    @Published var message: String
    private let interactor: ErrorInteractorProtocol
    
    init(interactor: ErrorInteractorProtocol, message: String) {
        self.interactor = interactor
        self.message = message
    }
    
    func retry() {
        interactor.handleRetry()
    }
}
