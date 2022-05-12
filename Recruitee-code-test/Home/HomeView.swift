//
//  HomeView.swift
//  Recruitee-code-test
//
//  Created by Emanuel Martínez on 12/5/22.
//

import UIKit
import RxSwift
import RxCocoa

class HomeView: UIViewController {
    
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    
    
    lazy var searchController: UISearchController = ({
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = true
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.searchBar.barStyle = .black
        controller.searchBar.backgroundColor = .clear
        controller.searchBar.placeholder = "Buscar una pélicula"
        return controller
    })()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "The Movies App"
        configureTableView()
        viewModel.bind(view: self, router: router)
        getData()
    }
    
    private func configureTableView() {
       
    }
    
    private func getData() {
        ManagerConnections.getMarketSummary()
    }
    
    private func reloadTableView() {
        
    }
    
}

extension HomeView: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searBar: UISearchBar)
    {
        searchController.isActive = false
        reloadTableView()
    }
}
