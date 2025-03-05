//
//  ExchangeListView.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import SwiftUI

struct ExchangeListView: View {
    @StateObject var presenter: ExchangeListPresenter
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                switch presenter.state {
                case .loading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.white)
                        .padding()
                        .accessibilityIdentifier("loadingIndicator")
                    
                case .error(_):
                    presenter.showError(message: LocalizedStrings.errorLoadingData)
                    
                case .loaded(let exchanges):
                    List(exchanges) { exchange in
                        ExchangeCell(exchange: exchange)
                            .listRowBackground(Color.black)
                            .listRowInsets(EdgeInsets())
                            .background(Color.black)
                            .overlay(
                                NavigationLink(
                                    destination: ExchangeDetailRouter.start(exchange: exchange)
                                ) {
                                    EmptyView()
                                }
                                    .opacity(0)
                            )
                    }
                    .listStyle(.plain)
                    .refreshable {
                        presenter.refreshData()
                    }
                }
            }
            .navigationTitle("Exchanges")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Exchanges")
                        .font(.headline)
                        .foregroundColor(.white)
                        .accessibilityIdentifier("screenTitle")
                }
            }
            .onAppear {
                presenter.viewDidLoad()
            }
        }
    }
}
