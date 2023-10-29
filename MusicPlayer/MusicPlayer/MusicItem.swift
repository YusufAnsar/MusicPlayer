//
//  MusicItem.swift
//  MusicPlayer
//
//  Created by maple on 29/10/23.
//

import Foundation

typealias MusicResponse = [MusicItem]

struct MusicItem: Decodable {
    let title: String
    let artist: String
    let album: String
    let url: String
}
