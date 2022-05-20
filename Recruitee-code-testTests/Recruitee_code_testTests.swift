//
//  Recruitee_code_testTests.swift
//  Recruitee-code-testTests
//
//  Created by Emanuel Martínez on 12/5/22.
//

import XCTest
@testable import Recruitee_code_test

class Recruitee_code_testTests: XCTestCase {
    
    var sut: URLSession!

    override func setUpWithError() throws {
      try super.setUpWithError()
      sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }
    
    func testCallAPIWorking()
    {
        //GIVEN
        let conectionWrapper = ManagerConnections()
        
        //WHEN
        conectionWrapper.getSummaryMarket().subscribe { stock in
            
        //THEN
            XCTAssertNotNil(stock.element?.first?.market)
        }
        .dispose()
    }
    
    func testCallDetailAPIWorking()
    {
        //GIVEN
        let conectionWrapper = ManagerConnections()
        let exchangeNameMocked = "CBOT"
        
        //WHEN
        conectionWrapper.getDetailStock(fullExchangeName: exchangeNameMocked)
            .subscribe { stock in
                
        //THEN
                XCTAssertEqual(stock.element?.symbol, exchangeNameMocked)
            }
            .dispose()
    }
    
    func testValidApiCallGetsHTTPStatusCode200() throws {
        //GIVEN
        let headers = [
            Constants.Headers.host: Constants.Endpoints.singleEndPoint,
            Constants.Headers.apyKey: Constants.apiKey
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: Constants.URL.main + Constants.Endpoints.urlMarketGetSummary)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = Constants.Method.get
        request.allHTTPHeaderFields = headers

      let expectation = expectation(description: "Status code: 200")

        //WHEN
        let dataTask = sut.dataTask(with: request as URLRequest) { _, response, error in
            
            //THEN
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
              expectation.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [expectation], timeout: 5)
    }
    
    func testFailedApiCallNotPassToken() throws {
      // given
      let urlString = Constants.URL.main + Constants.Endpoints.urlMarketGetSummary
      let url = URL(string: urlString)!
      let promise = expectation(description: "Completion handler invoked")
      var statusCode: Int?
      var responseError: Error?

      // when
      let dataTask = sut.dataTask(with: url) { _, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        promise.fulfill()
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)

      // then
      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, 401)
    }
}
