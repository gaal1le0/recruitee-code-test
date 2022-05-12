// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let stock = try? newJSONDecoder().decode(Stock.self, from: jsonData)

import Foundation

// MARK: - Stock
struct Stock: Codable {
    let defaultKeyStatistics: AssetProfile?
    let fundProfile: FundProfile?
    let financialsTemplate, topHoldings: AssetProfile?
    let price: Price?
    let fundPerformance: AssetProfile?
    let quoteType: QuoteType?
    let summaryDetail: AssetProfile?
    let symbol: String?
    let assetProfile, esgScores, pageViews: AssetProfile?
}

// MARK: - AssetProfile
struct AssetProfile: Codable {
}

// MARK: - FundProfile
struct FundProfile: Codable {
    let initInvestment: AssetProfile?
    let initAipInvestment, subseqIraInvestment: AssetProfile?
    let brokerages: [JSONAny]?
    let managementInfo: ManagementInfo?
    let subseqInvestment: AssetProfile?
    let feesExpensesInvestment: FeesExpensesInvestment?
    let maxAge: Int?
    let feesExpensesInvestmentCat: FeesExpensesInvestmentCat?
    let initIraInvestment, subseqAipInvestment: AssetProfile?

    enum CodingKeys: String, CodingKey {
        case initInvestment, initAipInvestment, subseqIraInvestment, brokerages, managementInfo, subseqInvestment
        case feesExpensesInvestment, maxAge, feesExpensesInvestmentCat, initIraInvestment, subseqAipInvestment
    }
}

// MARK: - FeesExpensesInvestment
struct FeesExpensesInvestment: Codable {
    let annualHoldingsTurnover, frontEndSalesLoad, annualReportExpenseRatio, netExpRatio: AssetProfile?
    let projectionValues, grossExpRatio, deferredSalesLoad, totalNetAssets: AssetProfile?
    let twelveBOne: AssetProfile?
}

// MARK: - FeesExpensesInvestmentCat
struct FeesExpensesInvestmentCat: Codable {
    let annualReportExpenseRatio, frontEndSalesLoad, deferredSalesLoad, twelveBOne: AssetProfile?
    let annualHoldingsTurnover, totalNetAssets, projectionValuesCat: AssetProfile?
}

// MARK: - ManagementInfo
struct ManagementInfo: Codable {
    let startdate: AssetProfile?
}

// MARK: - Price
struct Price: Codable {
    let quoteSourceName: String?
    let regularMarketOpen, averageDailyVolume3Month: AssetProfile?
    let exchange: String?
    let regularMarketTime: Int?
    let volume24Hr, regularMarketDayHigh: AssetProfile?
    let averageDailyVolume10Day: AssetProfile?
    let regularMarketChange, regularMarketPreviousClose, preMarketPrice: AssetProfile?
    let exchangeDataDelayedBy: Int?
    let postMarketChange, postMarketPrice: AssetProfile?
    let exchangeName: String?
    let preMarketChange, circulatingSupply, regularMarketDayLow: AssetProfile?
    let priceHint: PriceHint?
    let regularMarketPrice, regularMarketVolume: AssetProfile?
    let regularMarketSource: String?
    let openInterest: AssetProfile?
    let marketState: String?
    let marketCap: AssetProfile?
    let quoteType: String?
    let volumeAllCurrencies, strikePrice: AssetProfile?
    let symbol: String?
    let maxAge: Int?
}

// MARK: - PriceHint
struct PriceHint: Codable {
    let raw: Int?
    let fmt, longFmt: String?
}

// MARK: - QuoteType
struct QuoteType: Codable {
    let symbol, quoteType, exchange, exchangeTimezoneName: String?
    let exchangeTimezoneShortName, gmtOffSetMilliseconds, market: String?
    let isEsgPopulated: Bool?
}

// MARK: - Encode/decode helpers

    public var hashValue: Int {
        return 0
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
