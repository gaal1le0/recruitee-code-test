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
    let result: [Market]
}

// MARK: - Result
struct Market: Codable {
    let fullExchangeName: String
    let market: String
    let shortName: String?
}

// MARK: - RegularMarket
struct RegularMarket: Codable {
    let raw: Double
    let fmt: String
}

// MARK: - Spark
struct Spark: Codable {
    let symbol: String
    let timestamp: [Int]
    let close: [Double]
    let dataGranularity: Int
    let previousClose, chartPreviousClose: Double
    let end, start: Int
}
