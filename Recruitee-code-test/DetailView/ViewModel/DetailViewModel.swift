//
//  DetailViewModel.swift
//  TMDBApp22
//
//  Created by Emanuel Martínez on 12/5/22.
//

import Foundation
import RxSwift

class DetailViewModel {
    private weak var view: DetailViewController?
    private var router: DetailRouter?
    private var managerConnections = ManagerConnections()
    
    func bind(view: DetailViewController, router: DetailRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func getStockData(fullExchangeName: String) -> Observable<QuoteType> {
        return managerConnections.getDetailStock(fullExchangeName: fullExchangeName)
    }
}
