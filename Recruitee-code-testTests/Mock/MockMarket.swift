//
//  MockMarket.swift
//  Recruitee-code-testTests
//
//  Created by Emanuel Martínez on 19/5/22.
//

import Foundation

extension Market {
    
    static func with(fullExchangeName: String = "SNP",
                     market: String = "us_market",
                     shortName: String = "S&P 500" ) -> Market
    {
        return Market(fullExchangeName: fullExchangeName,
                      market: market,
                      shortName: shortName)
    }
}
