//
//  SearchInteractor.swift
//  iTunesSearchViper
//
//  Created by Рустам Т on 10/3/23.
//

import Foundation

protocol SearchInteractorProtocol {
    func fetchMusic(keyword: String)
}

protocol SearchInteractorOutputProtocol: AnyObject {
    func didFetchMusic(_ results: [MusicResult])
    func didFailToFetchMusic(_ error: Error)
}

final class SearchInteractor: SearchInteractorProtocol {
    weak var presenter: SearchInteractorOutputProtocol?
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    
    func fetchMusic(keyword: String) {
        Task {
            do {
                let musicAlbums = try await self.networkService.fetchMusic(keyword: keyword)
                self.presenter?.didFetchMusic(musicAlbums)
            } catch let error {
                self.presenter?.didFailToFetchMusic(error)
            }
        }
    }
}

