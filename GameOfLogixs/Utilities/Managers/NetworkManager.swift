//
//  File.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import SwiftUI
import CryptoKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()


    private init() {}


    func getCharacters(completed: @escaping (Result<APICharacterData, GOLError>) -> Void) {
        
        let baseURL = "https://gateway.marvel.com/"
        let pageParams = ""
        let urlString = "\(baseURL)v1/public/characters?apikey=\(APIKeys.publicKey)&hash=\(APIKeys.md5)&ts=\(APIKeys.ts)\(pageParams)"
        
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error  {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(APIResult.self, from: data)
                completed(.success(decodedResponse.data))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
    

    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cachekey = NSString(string: urlString)

        if let image = cache.object(forKey: cachekey) {
            completed(image)
            return
        }

        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }

            self.cache.setObject(image, forKey: cachekey)
            completed(image)
        }

        task.resume()
    }
}
