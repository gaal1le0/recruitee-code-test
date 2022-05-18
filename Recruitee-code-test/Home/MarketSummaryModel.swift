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
    let marketState: MarketState
    let customPriceAlertConfidence: CustomPriceAlertConfidence
    let market: String
    let spark: Spark
    let priceHint: Int
    let tradeable: Bool
    let exchange: String
    let sourceInterval: Int
    let region: Region
    let shortName: String?
    let regularMarketPreviousClose: RegularMarket
    let triggerable: Bool
}

enum CustomPriceAlertConfidence: String, Codable {
    case low = "LOW"
}

enum Language: String, Codable {
    case enUS = "en-US"
}

enum MarketState: String, Codable {
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
    let dataGranularity: Int
    let symbol: String
    let timestamp: [Int]
    let end, start: Int
    let previousClose, chartPreviousClose: Double
    let close: [Double]
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
