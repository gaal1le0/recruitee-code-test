//
//  DetailViewController.swift
//  TMDBApp22
//
//  Created by Emanuel Martínez on 12/5/22.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var imageFilm: UIImageView!
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var originalTitle: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    private var router = DetailRouter()
    private var viewModel = DetailViewModel()
    private var disposeBag = DisposeBag()
    var movieID: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataAndShowDetailMovie()
        viewModel.bind(view: self, router: router)
    }
    
    private func getDataAndShowDetailMovie() {
        guard let idMovie = movieID else { return }
        
        viewModel.getMovieData(movieID: idMovie)
            .subscribe (onNext: { movie in
                self.showMovieData(movie: movie)
            },
                        onError: { error in
                print("Ha ocurrido un error: \(error)")
            },
                        onCompleted: {
            }).disposed(by: disposeBag)
    }
    
    func showMovieData(movie: MovieDetail) {
        DispatchQueue.main.async {
            self.titleHeader.text = movie.title
            self.imageFilm.imageFromServerURL(urlString: Constants.URL.urlImages+movie.posterPath, placeholderImage: UIImage(named: "claqueta")!)
            self.descriptionMovie.text = movie.overview
            self.releaseDate.text = movie.releaseDate
            self.originalTitle.text = movie.originalTitle
            self.voteAverage.text = String(movie.voteAverage)
        }
    }
}
