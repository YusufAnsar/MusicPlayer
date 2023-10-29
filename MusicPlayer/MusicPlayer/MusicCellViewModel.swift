//
//  MusicCellViewModel.swift
//  MusicPlayer
//
//  Created by maple on 29/10/23.
//

import Foundation

class MusicListCellViewModel {
    let title: String
    let artist: String
    let album: String

    init(musicItem: MusicItem) {
        self.title = musicItem.title
        self.artist = musicItem.artist
        self.album = musicItem.album
    }

}
