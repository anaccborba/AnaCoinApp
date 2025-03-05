//
//  Exchange.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

struct Exchange: Codable, Identifiable, Equatable {
    let id: String?
    let name: String?
    let website: String?
    let dataQuoteStart: String?
    let dataQuoteEnd: String?
    let dataOrderbookStart: String?
    let dataOrderbookEnd: String?
    let dataTradeStart: String?
    let dataTradeEnd: String?
    let dataSymbolsCount: Int?
    let volume1hrsUsd: Double?
    let volume1dayUsd: Double?
    let volume1mthUsd: Double?
    let rank: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "exchange_id"
        case name
        case website
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1hrsUsd = "volume_1hrs_usd"
        case volume1dayUsd = "volume_1day_usd"
        case volume1mthUsd = "volume_1mth_usd"
        case rank
    }
}
