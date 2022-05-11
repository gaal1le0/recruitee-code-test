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
    private var movies = [Movie]()
    private var filteredMovies = [Movie]()
    
    
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
        manageSearchBarController()
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
    
    private func manageSearchBarController() {
        let searchBar = searchController.searchBar
        searchController.delegate = self
        
        myTableView.tableHeaderView = searchBar
        myTableView.contentOffset = CGPoint(x: 0, y: searchBar.frame.size.height)
        
        //PROGRAMACIÓN REACTIVA PARA CUANDO SE BUSQUE ALGO EN EL BUSCADOR LOS DATOS SE MUESTREN EN LA VISTA DE TABLA
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { (result) in
                self.filteredMovies = self.movies.filter({ movie in
                    self.reloadTableView()
                    return movie.title.contains(result)
                })
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

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return self.filteredMovies.count
        } else {
            return self.movies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.imageMovie.imageFromServerURL(urlString: Constants.URL.urlImages+self.filteredMovies[indexPath.row].posterPath, placeholderImage: UIImage(named: "claqueta")!)
            cell.titleMovie.text = filteredMovies[indexPath.row].title
            cell.descriptionMovie.text = filteredMovies[indexPath.row].sinopsis
        } else {
            cell.imageMovie.imageFromServerURL(urlString: Constants.URL.urlImages+self.movies[indexPath.row].posterPath, placeholderImage: UIImage(named: "claqueta")!)
            cell.titleMovie.text = self.movies[indexPath.row].title
            cell.descriptionMovie.text = self.movies[indexPath.row].sinopsis
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive && searchController.searchBar.text != "" {
            viewModel.makeDetailView(movieID: String(self.filteredMovies[indexPath.row].movieID))
        } else {
            viewModel.makeDetailView(movieID: String(self.movies[indexPath.row].movieID))
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
