//
//  HomeViewModel.swift
//  TMDBApp22
//
//  Created by Emanuel Martínez on 12/5/22.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    private weak var view: HomeView?
    private var router: HomeRouter?
    private var managerConnections = ManagerConnections()
    
    func bind(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func getListStockOptions() -> Observable<[Market]> {
        return managerConnections.getSummaryMarket()
    }
    
    func makeDetailView(fullExchangeName: String) {
        router?.navigateToDetailView(fullExchangeName: fullExchangeName)
    }
    
}
