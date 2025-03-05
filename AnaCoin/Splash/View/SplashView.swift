//
//  SplashView.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject var presenter: SplashPresenter
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                AnimationView(animationName: "SplashAnimation")
                    .frame(width: .animationSize, height: .animationSize)
                    .onAppear {
                        presenter.startSplash()
                    }.accessibilityIdentifier("SplashAnimation")
                
                Text(LocalizedStrings.splashTitle).foregroundStyle(.white)
                Text(LocalizedStrings.splashSubtitle).foregroundStyle(.gray).font(.caption2)
            }
        }
    }
}
