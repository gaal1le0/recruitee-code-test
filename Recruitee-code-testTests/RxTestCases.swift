//
//  RxTestCases.swift
//  Recruitee-code-testTests
//
//  Created by Emanuel Martínez on 19/5/22.
//

import XCTest
import RxSwift
import RxBlocking
import RxTest
@testable import Recruitee_code_test

class RxTestCases: XCTestCase {

    func testViewModelResult() {
        
        //WHEN
        let viewModel = HomeViewModel()
        let observable = viewModel.getListStockOptions().toBlocking()
        
        //GIVEN
        let data = try! observable.first()
        
        //THEN
        XCTAssertNotNil(data)
    }

    
}
