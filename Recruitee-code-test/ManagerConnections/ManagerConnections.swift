//
//  ManagerConnections.swift
//  Recruitee-code-test
//
//  Created by Sergio Becerril on 12/5/22.
//

import Foundation

import RxSwift


class ManagerConnections {
    
   static func getMarketSummary() {
        let headers = [
            "X-RapidAPI-Host": "yh-finance.p.rapidapi.com",
            "X-RapidAPI-Key": "a039144774mshca594ff07e2c4c3p1b2b61jsn6b1c931eed8c"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: Constants.URL.main + Constants.Endpoints.urlMarketGetSummary)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }

                if response.statusCode == 200 {
                    
                    do {
                        let decoder = JSONDecoder()
                        let stock = try decoder.decode(MarketSummary.self, from: data)
                        
                        print("Estamos recuperando la stock: \(stock.marketSummaryAndSparkResponse.result[0])")
                    } catch let error {
                        print("Ha ocurrido un error: \(error.localizedDescription)")
                    }
                }
        })
        
        dataTask.resume()
    }
}
