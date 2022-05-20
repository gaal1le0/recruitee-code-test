//
//  MarketTableViewViewModelTests.swift
//  Recruitee-code-testTests
//
//  Created by Emanuel Martínez on 19/5/22.
//

import XCTest
import RxSwift
import RxBlocking
import RxTest
@testable import Recruitee_code_test

class HomeViewModelTests: XCTestCase {
    
    // MARK: - getFriend
    func testCallOK() {
        let disposeBag = DisposeBag()
        let appServer = MockApp()
        appServer.getMarketResult = .success([Market.with()])
        
        
        appServer.getSummaryMarket().subscribe(
            onNext: { market in
                XCTAssertNotNil(market)
            }
        ).disposed(by: disposeBag)
        
        
    }
    
    private final class MockApp: ManagerConnections {
        var getMarketResult: Result<[Market], ManagerConnections.GetSummaryMarketFailureReason>?
        
        override func getSummaryMarket() -> Observable<[Market]> {
            return Observable.create { observer in
                switch self.getMarketResult {
                case .success(let market):
                    observer.onNext(market)
                case .failure:
                    observer.onError(ManagerConnections.GetSummaryMarketFailureReason.moved)
                case .none:
                    observer.onError(ManagerConnections.GetSummaryMarketFailureReason.notFound)
                }
                return Disposables.create()
            }
        }
    }
}
