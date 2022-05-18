// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let marketSummary = try? newJSONDecoder().decode(MarketSummary.self, from: jsonData)

import Foundation

// MARK: - MarketSummary
struct MarketSummary: Codable {
    let marketSummaryAndSparkResponse: MarketSummaryAndSparkResponse
}

// MARK: - MarketSummaryAndSparkResponse
struct MarketSummaryAndSparkResponse: Codable {
    let result: [Result]
    let error: JSONNull?
}

// MARK: - Result
struct Result: Codable {
    let exchangeTimezoneName, fullExchangeName, symbol: String
    let gmtOffSetMilliseconds, exchangeDataDelayedBy, firstTradeDateMilliseconds: Int
    let language: Language
    let regularMarketTime: RegularMarket
    let exchangeTimezoneShortName, quoteType: String
    let customPriceAlertConfidence: CustomPriceAlertConfidence
    let marketState: MarketState
    let market: String
    let spark: Spark
    let priceHint: Int
    let tradeable: Bool
    let exchange: String
    let sourceInterval: Int
    let shortName: String?
    let region: Region
    let triggerable: Bool
    let regularMarketPreviousClose: RegularMarket
}

enum CustomPriceAlertConfidence: String, Codable {
    case low = "LOW"
}

enum Language: String, Codable {
    case enUS = "en-US"
}

enum MarketState: String, Codable {
    case post = "POST"
    case prepre = "PREPRE"
    case regular = "REGULAR"
}

enum Region: String, Codable {
    case us = "US"
}

// MARK: - RegularMarket
struct RegularMarket: Codable {
    let raw: Double
    let fmt: String
}

// MARK: - Spark
struct Spark: Codable {
    let timestamp: [Int]
    let symbol: String
    let previousClose, chartPreviousClose: Double
    let end, start: Int
    let close: [Double?]
    let dataGranularity: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
