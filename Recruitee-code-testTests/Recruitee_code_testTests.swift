//
//  Recruitee_code_testTests.swift
//  Recruitee-code-testTests
//
//  Created by Emanuel Martínez on 12/5/22.
//

import XCTest
@testable import Recruitee_code_test

class Recruitee_code_testTests: XCTestCase {
    
    func testCallAPIWorking()
    {
        //WHEN
        let conectionWrapper = ManagerConnections()
        //GIVEN
        conectionWrapper.getSummaryMarket().subscribe { stock in
        //THEN
            XCTAssertNotNil(stock.element?.first?.market)
        }
        .dispose()
    }
    
    func testCallDetailAPIWorking()
    {
        //WHEN
        let conectionWrapper = ManagerConnections()
        let exchangeNameMocked = "CBOT"
        
        //GIVEN
        conectionWrapper.getDetailStock(fullExchangeName: exchangeNameMocked)
            .subscribe { stock in
                
        //THEN
                XCTAssertEqual(stock.element?.symbol, exchangeNameMocked)
            }
            .dispose()
    }
}
