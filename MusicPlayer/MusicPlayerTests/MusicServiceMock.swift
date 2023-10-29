//
//  MusicServiceMock.swift
//  MusicPlayerTests
//
//  Created by maple on 29/10/23.
//

import Foundation
@testable import MusicPlayer

class MusicServiceMock: MusicServiceable {

    func getMusicLists() async -> Result<MusicResponse, RequestError> {
        let musicItem1 = MusicItem(title: "title", artist: "artist", album: "album", url: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3")
        let musicItem2 = MusicItem(title: "title", artist: "artist", album: "album", url: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3")
        return .success([musicItem1, musicItem2])
    }
}
