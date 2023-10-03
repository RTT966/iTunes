//
//  NetworkManager.swift
//  iTunesSearchViper
//
//  Created by Рустам Т on 10/3/23.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchMusic(keyword: String) async throws -> [MusicResult]
}

enum NetworkError: Error {
    case invalidKeyword
    case invalidURL
    case noData
}

final class NetworkService: NetworkServiceProtocol {
    
    func fetchMusic(keyword: String) async throws -> [MusicResult] {
        guard let encodedKeyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw NetworkError.invalidKeyword }
        
        let urlString = "https://itunes.apple.com/search?term=\(encodedKeyword)"
        
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        
        let response = try await URLSession.shared.data(from: url)
        
        let musicModel = try JSONDecoder().decode(MusicModel.self, from: response.0)
        return musicModel.results
    }
}
