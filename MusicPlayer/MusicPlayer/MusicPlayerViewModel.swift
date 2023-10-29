//
//  MusicPlayerViewModel.swift
//  MusicPlayer
//
//  Created by maple on 29/10/23.
//

import Foundation

protocol MusicPlayerViewModelInput: AnyObject {
    var viewController: MusicPlayerViewModelOutput? { get set }
}

protocol MusicPlayerViewModelOutput: AnyObject {

}

class MusicPlayerViewModel {
    
    private let musicItem: MusicItem
    weak var viewController: MusicPlayerViewModelOutput?
    
    init(musicItem: MusicItem) {
        self.musicItem = musicItem
    }
}

extension MusicPlayerViewModel: MusicPlayerViewModelInput {

}


