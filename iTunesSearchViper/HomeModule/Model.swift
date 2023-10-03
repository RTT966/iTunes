//
//  Model.swift
//  iTunesSearchViper
//
//  Created by Рустам Т on 10/3/23.
//

struct MusicModel: Codable {
    let results: [MusicResult]
}

struct MusicResult: Codable {
    let artistName, collectionName: String
    let trackName: String?
    let previewUrl: String?
    let artworkUrl100: String
}

