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
    var fullExchangeName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
    }
    

}
