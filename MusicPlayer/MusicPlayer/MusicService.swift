//
//  MusicService.swift
//  MusicPlayer
//
//  Created by maple on 29/10/23.
//

import Foundation

protocol MusicServiceable: AnyObject {
    func getMusicLists() async -> Result<MusicResponse, RequestError>
}

class MusicService: MusicServiceable {

    func getMusicLists() async -> Result<MusicResponse, RequestError> {
        guard let url = URL(string: "https://www.jsonkeeper.com/b/C47J") else {
            return .failure(.invalidURL)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            if let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 299  {
                let responseData = try JSONDecoder().decode(MusicResponse.self, from: data)
                return .success(responseData)
            }
        } catch {
            return .failure(.unknownError)
        }
        return .failure(.unknownError)
    }

}
