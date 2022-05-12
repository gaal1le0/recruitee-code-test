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
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    
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
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.register(UINib(nibName: "HomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    private func getData() {
        viewModel.getListPopularMoviesData()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe (
                onNext: { movies in
                    self.movies = movies
                    self.reloadTableView()
                }, onError: { error in
                    print("Hay un error \(error.localizedDescription)")
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.myActivity.stopAnimating()
            self.myActivity.isHidden = true
            self.myTableView.reloadData()
        }
    }
    
}

extension HomeView: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searBar: UISearchBar)
    {
        searchController.isActive = false
        reloadTableView()
    }
}
