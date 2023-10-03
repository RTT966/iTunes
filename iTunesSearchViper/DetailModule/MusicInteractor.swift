//
//  MusicInteractor.swift
//  iTunesSearchViper
//
//  Created by Рустам Т on 10/3/23.
//

import Foundation

protocol MusicPlayerInteractorProtocol {
    func getMusicResult() -> MusicResult
}

final class MusicPlayerInteractor {
    let musicResult: MusicResult
    
    init(musicResult: MusicResult) {
        self.musicResult = musicResult
    }
}

extension MusicPlayerInteractor: MusicPlayerInteractorProtocol {
    func getMusicResult() -> MusicResult {
        return musicResult
    }
}

