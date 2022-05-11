//
//  HomeRouter.swift
//  Recruitee-code-test
//
//  Created by Emanuel Martínez on 12/5/22.
//

import UIKit

class HomeRouter {
    
    var viewController: UIViewController {
        return createViewController()
    }
    private var sourceView: UIViewController?
    
    func setSourceView(_ sourceView: UIViewController?) {
        guard let view = sourceView else { fatalError("Error desconocido")}
        self.sourceView = view
    }
    
    private func createViewController() -> UIViewController {
        let view = HomeView(nibName: "HomeView", bundle: Bundle.main)
        return view
    }
}
