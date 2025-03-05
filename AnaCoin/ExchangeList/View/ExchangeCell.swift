//
//  ExchangeCell.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import SwiftUI

struct ExchangeCell: View {
    let exchange: Exchange

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    if let name = exchange.name, !name.isEmpty {
                        Text(name)
                            .font(.headline)
                            .foregroundColor(.white)
                    }

                    if let id = exchange.id {
                        Text(id)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .accessibilityIdentifier("exchangeCell_\(id)")
                    }

                    HStack {
                        Text(LocalizedStrings.exchangeCellTag)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.small)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(.tagCornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: .tagCornerRadius)
                                    .stroke(Color.blue, lineWidth: 1)
                            )

                        Text("$\(exchange.volume1dayUsd ?? 0, specifier: "%.2f")")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                }
                Spacer()
            }
            .padding()
            .background(Color.black)

            Divider()
                .background(Color.gray)
        }
    }
}

struct ExchangeCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExchangeCell(exchange: Exchange(
                id: "BINANCE",
                name: "Binance",
                website: "https://www.binance.com",
                dataQuoteStart: nil,
                dataQuoteEnd: nil,
                dataOrderbookStart: nil,
                dataOrderbookEnd: nil,
                dataTradeStart: nil,
                dataTradeEnd: nil,
                dataSymbolsCount: nil,
                volume1hrsUsd: 15000000,
                volume1dayUsd: 350000000,
                volume1mthUsd: 10500000000,
                rank: 1
            ))
            .previewDisplayName("Complete Cell")

            ExchangeCell(exchange: Exchange(
                id: "BINANCE",
                name: nil,
                website: "https://www.binance.com",
                dataQuoteStart: nil,
                dataQuoteEnd: nil,
                dataOrderbookStart: nil,
                dataOrderbookEnd: nil,
                dataTradeStart: nil,
                dataTradeEnd: nil,
                dataSymbolsCount: nil,
                volume1hrsUsd: 15000000,
                volume1dayUsd: 350000000,
                volume1mthUsd: 10500000000,
                rank: 1
            ))
            .previewDisplayName("No name cell")
        }
        .previewLayout(.sizeThatFits)
    }
}
