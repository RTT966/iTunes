//
//  MusicPresenter.swift
//  iTunesSearchViper
//
//  Created by Рустам Т on 10/3/23.
//

import Foundation

protocol MusicPlayerViewProtocol: AnyObject {
    func showMusicDetails(_ musicResult: MusicResult)
}

protocol MusicPlayerPresenterProtocol {
    func configure(with musicResult: MusicResult)
}

final class MusicPlayerPresenter {
    weak var view: MusicPlayerViewProtocol?
}

extension MusicPlayerPresenter: MusicPlayerPresenterProtocol {
    func configure(with musicResult: MusicResult) {
        view?.showMusicDetails(musicResult)
    }
}
