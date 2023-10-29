//
//  RequestError.swift
//  MusicPlayer
//
//  Created by maple on 29/10/23.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case decodingError
    case unknownError

    var description: String {
        switch self {
            case .invalidURL:
                return "Invalid URL"
            case .decodingError:
                return "Decoding Error"
            case .unknownError:
                return "Unknown Error"
        }
    }
}
