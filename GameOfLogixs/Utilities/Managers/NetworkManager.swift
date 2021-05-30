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


    func getCharacters(completed: @escaping (Result<[Character], GOLError>) -> Void) {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(APIKeys.privateKey)\(APIKeys.publicKey)")
        let marvelEndURL = "https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apikey=\(APIKeys.privateKey)&hash\(hash)"
        
        
        guard let url = URL(string: marvelEndURL) else {
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
                let decodedResponse = try decoder.decode(APICharacterData.self, from: data)
                completed(.success(decodedResponse.results))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
    
    func MD5(data: String) -> String {
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }

//    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
//        let cachekey = NSString(string: urlString)
//
//        if let image = cache.object(forKey: cachekey) {
//            completed(image)
//            return
//        }
//
//        guard let url = URL(string: urlString) else {
//            completed(nil)
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data, let image = UIImage(data: data) else {
//                completed(nil)
//                return
//            }
//
//            self.cache.setObject(image, forKey: cachekey)
//            completed(image)
//        }
//
//        task.resume()
//    }
}
