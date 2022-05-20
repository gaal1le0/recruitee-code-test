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
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
<<<<<<< HEAD
    private var markets = [Result]()
    private var filteredMarket = [Result]()
=======
    private var markets = [Market]()
    private var filteredMarket = [Market]()
    var timer = Timer()
>>>>>>> release/1.1
    
    lazy var searchController: UISearchController = ({
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = true
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.searchBar.barStyle = .black
        controller.searchBar.backgroundColor = .clear
        controller.searchBar.placeholder = "Search"
        return controller
    })()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Yahoo Finance"
        configureTableView()
        viewModel.bind(view: self, router: router)
        getData()
        manageSearchBarController()
<<<<<<< HEAD
=======
        scheduledTimerWithTimeInterval()
    }
    
    private func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        DispatchQueue.global(qos: .background).async {
            self.getData()
            DispatchQueue.main.async {
                self.reloadTableView()
            }
        }
>>>>>>> release/1.1
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    private func getData() {
        viewModel.getListStockOptions()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe (
                onNext: { markets in
                    self.markets = markets
                    self.reloadTableView()
                }, onError: { error in
                    print("Hay un error \(error.localizedDescription)")
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    private func manageSearchBarController() {
        let searchBar = searchController.searchBar
        searchController.delegate = self
        
        tableView.tableHeaderView = searchBar
        tableView.contentOffset = CGPoint(x: 0, y: searchBar.frame.size.height)
<<<<<<< HEAD
        
        //PROGRAMACIÓN REACTIVA PARA CUANDO SE BUSQUE ALGO EN EL BUSCADOR LOS DATOS SE MUESTREN EN LA VISTA DE TABLA
=======

>>>>>>> release/1.1
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { (result) in
                self.filteredMarket = self.markets.filter({ market in
                    self.reloadTableView()
                    return market.fullExchangeName.contains(result)
                })
            }).disposed(by: disposeBag)
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return self.filteredMarket.count
        } else {
            return self.markets.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        
        if searchController.isActive && searchController.searchBar.text != "" {
<<<<<<< HEAD

=======
            
>>>>>>> release/1.1
            cell.titleMarket.text = filteredMarket[indexPath.row].fullExchangeName
            cell.market.text = filteredMarket[indexPath.row].market
            cell.shortName.text = filteredMarket[indexPath.row].shortName
        } else {
            cell.titleMarket.text = self.markets[indexPath.row].fullExchangeName
            cell.market.text = self.markets[indexPath.row].market
            cell.shortName.text = self.markets[indexPath.row].shortName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
<<<<<<< HEAD
        if searchController.isActive && searchController.searchBar.text != "" {
            viewModel.makeDetailView(fullExchangeName: String(self.filteredMarket[indexPath.row].exchange))
        } else {
            viewModel.makeDetailView(fullExchangeName: String(self.markets[indexPath.row].exchange))
=======
        searchController.isActive = false
        if searchController.isActive && searchController.searchBar.text != "" {
            viewModel.makeDetailView(fullExchangeName: String(self.filteredMarket[indexPath.row].fullExchangeName))
        } else {
            viewModel.makeDetailView(fullExchangeName: String(self.markets[indexPath.row].fullExchangeName))
>>>>>>> release/1.1
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
