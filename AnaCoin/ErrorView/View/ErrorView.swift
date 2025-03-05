//
//  ErrorView.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//


import SwiftUI

struct ErrorView: View {
    @StateObject var presenter: ErrorPresenter
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .frame(width: .iconSize, height: .iconSize)
                    .foregroundColor(.blue)
                
                Text(LocalizedStrings.errorOccurred)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, .small)
                
                Text(presenter.message)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.bottom, .small)
                
                Button(action: presenter.retry) {
                    Text(LocalizedStrings.tryAgain)
                        .foregroundColor(.white)
                        .frame(height: .buttonHeight)
                        .padding(.horizontal, .extraLarge)
                        .overlay(
                            RoundedRectangle(cornerRadius: .buttonCornerRadius)
                                .stroke(Color.white)
                        )
                }
                .padding(.top, .medium)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = ErrorInteractor { print("Try again pressed") }
        let presenter = ErrorPresenter(interactor: interactor, message: LocalizedStrings.errorLoadingData)
        
        return ErrorView(presenter: presenter).previewLayout(.sizeThatFits)
    }
}
