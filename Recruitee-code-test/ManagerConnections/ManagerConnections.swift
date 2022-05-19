//
//  ManagerConnections.swift
//  Recruitee-code-test
//
//  Created by Emanuel Martínez on 12/5/22.
//

import Foundation

import RxSwift


class ManagerConnections {
    
    func getSummaryMarket() -> Observable<[Result]> {
        return Observable.create { observer in
            
            let headers = [
                Constants.Headers.host: Constants.Endpoints.singleEndPoint,
                Constants.Headers.apyKey: Constants.apiKey
            ]
            
            
            let request = NSMutableURLRequest(url: NSURL(string: Constants.URL.main + Constants.Endpoints.urlMarketGetSummary)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = Constants.Method.get
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
                
                
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    
                    do {
                        let decoder = JSONDecoder()
                        let market = try decoder.decode(MarketSummary.self, from: data)
                        
                        print("Estamos recuperando la stock: \(market.marketSummaryAndSparkResponse.result[0])")
                        observer.onNext(market.marketSummaryAndSparkResponse.result)
                    } catch let error {
                        print("Ha ocurrido un error: \(error.localizedDescription)")
                    }
                }
                else if response.statusCode == 401 {
                    print("Error 401")
                }
                observer.onCompleted()
            }.resume()
            
            return Disposables.create {
            }
        }
    }
    
    func getDetailStock(fullExchangeName: String) -> Observable<QuoteType> {
        print("se recibe el param: \(String(describing: fullExchangeName))")
        return Observable.create { observer in
            
            let headers = [
                Constants.Headers.host: Constants.Endpoints.singleEndPoint,
                Constants.Headers.apyKey: Constants.apiKey
            ]
            
            let fullExchangeNameTrimmed = fullExchangeName.removeWhitespace()
            
            let request = NSMutableURLRequest(url: NSURL(string: Constants.URL.main + Constants.Endpoints.urlStockGetSummary+Constants.Parameter.symbol+fullExchangeNameTrimmed+Constants.Parameter.region)! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = Constants.Method.get
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
                
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    
                    do {
                        let decoder = JSONDecoder()
                        let stock = try decoder.decode(Stock.self, from: data)
                        guard let quoteType = stock.quoteType else { return }
                        print("Estamos recuperando la stock: \(String(describing: stock.quoteType?.symbol))")
                        observer.onNext(quoteType)
                    } catch let error {
                        print("Ha ocurrido un error: \(error.localizedDescription)")
                    }
                }
                else if response.statusCode == 401 {
                    print("Error 401")
                    observer.onError(AppError.invalidParam)
                }
                else if response.statusCode == 302 {
                    print("Error 302")
                    observer.onError(AppError.invalidParam)
                }
                observer.onCompleted()
            }.resume()
            
            return Disposables.create {
            }
        }
    }
}
