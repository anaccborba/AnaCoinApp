//
//  SplashPresenter.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import Foundation

class SplashPresenter: ObservableObject {
    private let router: SplashRouter
    
    init(router: SplashRouter) {
        self.router = router
    }
    
    func startSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.router.navigateToExchangeList()
        }
    }
}
