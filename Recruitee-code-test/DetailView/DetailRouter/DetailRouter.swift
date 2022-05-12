//
//  DetailRouter.swift
//  TMDBApp22
//
//  Created by Emanuel Martínez on 12/5/22.
//

import UIKit

class DetailRouter {
    var viewController: UIViewController {
        return createViewController()
    }
    
    var fullExchangeName: String?
    private var sourceView: UIViewController?
    
    init(fullExchangeName: String? = "") {
        self.fullExchangeName = fullExchangeName
    }
    
    func setSourceView(_ sourceView: UIViewController?) {
        guard let view = sourceView else { fatalError("Error desconocido")}
        self.sourceView = view
    }
    
    private func createViewController() -> UIViewController {
        let view = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        view.fullExchangeName = self.fullExchangeName
        return view
    }
}
