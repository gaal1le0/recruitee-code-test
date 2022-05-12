//
//  Constants.swift
//  TMDBApp22
//
//  Created by Emanuel Martínez on 12/5/22.
//

import Foundation

struct Constants {
    
    static let apiKey = "a039144774mshca594ff07e2c4c3p1b2b61jsn6b1c931eed8c"
    
    struct URL {
        static let main = "https://yh-finance.p.rapidapi.com/"
    }
    
    struct Endpoints {
        
        static let singleEndPoint = "yh-finance.p.rapidapi.com"
        static let urlMarketGetSummary = "market/v2/get-summary"
        static let urlStockGetSummary = "stock/v2/get-summary"
    }
    
    struct Headers {
        static let host = "X-RapidAPI-Host"
        static let apyKey = "X-RapidAPI-Key"
    }
    
    struct Method {
        static let get = "GET"
    }
    
    struct Parameter {
        static let symbol = "?symbol="
        static let region = "&region=U"
    }
}
