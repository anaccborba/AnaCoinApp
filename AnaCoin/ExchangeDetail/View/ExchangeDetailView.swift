//
//  ExchangeDetailView.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import SwiftUI

struct ExchangeDetailView: View {
    @StateObject var presenter: ExchangeDetailPresenter
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack(spacing: .medium) {
                    titleSection
                    volumeSection
                    dateSection
                    Spacer()
                }
                .padding()
            }
        }
    }
}

private extension ExchangeDetailView {
    var titleSection: some View {
        VStack(spacing: .small) {
            Text(presenter.exchange.name ?? LocalizedStrings.exchangeDetailName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .accessibilityIdentifier("exchangeDetailTitle")
            
            if let id = presenter.exchange.id {
                DetailRowView(title: LocalizedStrings.exchangeDetailId, value: id)
            }
            
            if let rank = presenter.exchange.rank {
                DetailRowView(title: LocalizedStrings.exchangeDetailRank, value: "\(rank)", color: .blue)
            }
            
            if let website = presenter.exchange.website, let url = URL(string: website) {
                HStack {
                    Text(LocalizedStrings.exchangeDetailWebsite)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Link(destination: url) {
                        Text(website)
                            .font(.title3)
                            .foregroundColor(.blue)
                            .underline()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    var volumeSection: some View {
        VStack(spacing: .small) {
            SectionTitle(text: LocalizedStrings.exchangeDetailVolumeTitle)
            
            if let volume1hrs = presenter.exchange.volume1hrsUsd {
                DetailRowView(title: LocalizedStrings.exchangeDetailVolume1h, value: "$\(volume1hrs)", color: .blue)
            }
            
            if let volume1day = presenter.exchange.volume1dayUsd {
                DetailRowView(title: LocalizedStrings.exchangeDetailVolume24h, value: "$\(volume1day)", color: .blue)
            }
            
            if let volume1mth = presenter.exchange.volume1mthUsd {
                DetailRowView(title: LocalizedStrings.exchangeDetailVolume1mth, value: "$\(volume1mth)", color: .blue)
            }
        }
    }
    
    var dateSection: some View {
        VStack(spacing: .small) {
            SectionTitle(text: LocalizedStrings.exchangeDetailDateTitle)
            
            if let dataQuoteStart = presenter.exchange.dataQuoteStart {
                DetailRowView(title: LocalizedStrings.exchangeDetailQuoteStart, value: dataQuoteStart.formattedDate(), color: .gray)
            }
            
            if let dataQuoteEnd = presenter.exchange.dataQuoteEnd {
                DetailRowView(title: LocalizedStrings.exchangeDetailQuoteEnd, value: dataQuoteEnd.formattedDate(), color: .gray)
            }
            
            if let dataOrderbookStart = presenter.exchange.dataOrderbookStart {
                DetailRowView(title: LocalizedStrings.exchangeDetailOrderbookStart, value: dataOrderbookStart.formattedDate(), color: .gray)
            }
            
            if let dataOrderbookEnd = presenter.exchange.dataOrderbookEnd {
                DetailRowView(title: LocalizedStrings.exchangeDetailOrderbookEnd, value: dataOrderbookEnd.formattedDate(), color: .gray)
            }
            
            if let dataTradeStart = presenter.exchange.dataTradeStart {
                DetailRowView(title: LocalizedStrings.exchangeDetailTradeStart, value: dataTradeStart.formattedDate(), color: .gray)
            }
            
            if let dataTradeEnd = presenter.exchange.dataTradeEnd {
                DetailRowView(title: LocalizedStrings.exchangeDetailTradeEnd, value: dataTradeEnd.formattedDate(), color: .gray)
            }
        }
    }
}

struct DetailRowView: View {
    
    let title: String
    let value: String
    var color: Color = .white
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(value)
                .font(.title3)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SectionTitle: View {
    
    let text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
    }
}

struct ExchangeDetailView_Preview: PreviewProvider {
    static var previews: some View {
        let exchange = Exchange(
            id: "BINANCE",
            name: "Binance",
            website: "https://www.binance.com/",
            dataQuoteStart: "2017-12-18T00:00:00.0000000Z",
            dataQuoteEnd: "2025-03-03T00:00:00.0000000Z",
            dataOrderbookStart: "2017-12-18T00:00:00.0000000Z",
            dataOrderbookEnd: "2025-03-03T00:00:00.0000000Z",
            dataTradeStart: "2017-07-14T00:00:00.0000000Z",
            dataTradeEnd: "2025-02-24T00:00:00.0000000Z",
            dataSymbolsCount: 229,
            volume1hrsUsd: 604797270.95,
            volume1dayUsd: 21141942317.05,
            volume1mthUsd: 545107988842.43,
            rank: 2
        )
        
        let interactor = ExchangeDetailInteractor(exchange: exchange)
        
        let presenter = ExchangeDetailPresenter(interactor: interactor)
        
        return ExchangeDetailView(presenter: presenter)
            .previewLayout(.sizeThatFits)
    }
}
