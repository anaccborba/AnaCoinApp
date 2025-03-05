//
//  SplashRouter.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import SwiftUI

class SplashRouter {
    func navigateToExchangeList() {
        let window = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first }
            .first
        
        window?.rootViewController = UIHostingController(rootView: ExchangeListRouter.start())
        window?.makeKeyAndVisible()
    }
    
    static func start() -> SplashView {
        let router = SplashRouter()
        let presenter = SplashPresenter(router: router)
        return SplashView(presenter: presenter)
    }
}

