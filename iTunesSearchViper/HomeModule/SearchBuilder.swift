//
//  SearchBuilder.swift
//  iTunesSearchViper
//
//  Created by Рустам Т on 10/3/23.
//

import UIKit

protocol SearchConfigureProtocol {
    func configure()-> UIViewController
}

final class SearchBuilder: SearchConfigureProtocol {
    
    func configure() -> UIViewController {
        let view = SearchViewController()
        let presenter = SearchPresenter()
        let interactor = SearchInteractor(networkService: NetworkService())
        let router = SearchRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
