//
//  DetailViewController.swift
//  TMDBApp22
//
//  Created by Emanuel Martínez on 12/5/22.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var activity: UIActivityIndicatorView!
    @IBOutlet private weak var titleHeader: UILabel!

    @IBOutlet private weak var symbol: UILabel!
    @IBOutlet private weak var type: UILabel!
    @IBOutlet private weak var exchange: UILabel!
    @IBOutlet private weak var market: UILabel!
    
    private var router = DetailRouter()
    private var viewModel = DetailViewModel()
    private var disposeBag = DisposeBag()
    var fullExchangeName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        getDataAndShowDetailStock()
        activity.startAnimating()
    }
    
    private func getDataAndShowDetailStock() {
        guard let fullExchange = fullExchangeName else { return }
        
        viewModel.getStockData(fullExchangeName: fullExchange)
            .subscribe (onNext: { stock in
                self.showStock(stock: stock)
            },
                        onError: { error in
                print("Ha ocurrido un error: \(error)")
            },
                        onCompleted: {
            }).disposed(by: disposeBag)
    }
    
    func showStock(stock: QuoteType) {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.hidesWhenStopped = true
            self.titleHeader.text = stock.exchange ?? ""
            self.symbol.text = stock.symbol ?? ""
            self.type.text = stock.quoteType ?? ""
            self.exchange.text = stock.exchange ?? ""
            self.market.text = stock.market ?? ""
        }
    }
}
