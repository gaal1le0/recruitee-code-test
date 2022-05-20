//
//  MarketTests.swift
//  Recruitee-code-testTests
//
//  Created by Emanuel Martínez on 19/5/22.
//

import XCTest

class MarketTests: XCTestCase {

    func testSuccessfulInit() {
        let testSuccessfulJSON: JSON = ["fullExchangeName": "SNP",
                                    "market": "us_market",
                                    "shortName": "S&P 500"]

        XCTAssertNotNil(Market(json: testSuccessfulJSON))
    }
    
    func testSuccessData() {
        let testSuccessfulJSON: JSON = ["fullExchangeName": "SNP",
                                    "market": "us_market",
                                    "shortName": "S&P 500"]

        XCTAssertEqual(testSuccessfulJSON["fullExchangeName"] as! String, "SNP")
    }
    
    
}

// Mark: - extension Friend
private extension Market {
    init?(json: JSON) {
        guard let fullExchangeName = json["fullExchangeName"] as? String,
            let market = json["market"] as? String,
            let shortName = json["shortName"] as? String else {
                return nil
        }
        self.fullExchangeName = fullExchangeName
        self.market = market
        self.shortName = shortName
    }
}
