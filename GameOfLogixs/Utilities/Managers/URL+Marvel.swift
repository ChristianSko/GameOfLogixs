//
//  URL+Marvel.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import Foundation

extension URL{
    
    static private let baseURL = "https://gateway.marvel.com/"
    
    private enum Endpoint: String {
        case characters = "v1/public/characters"
        case comics = "v1/public/comics"
    }
    
    static func characters(_ characterId: String? = nil, limit: Int, offset: Int, nameStartsWith: String? = nil) -> URL? {
        var endPoint = Endpoint.characters.rawValue
        var pageParams = ""
        if let _ = characterId {
            endPoint = endPoint + "/\(characterId!)"
        } else {
            pageParams = "&limit=\(limit)&offset=\(offset)"
        }
        if let name = nameStartsWith, name.count > 0 {
            pageParams = "&nameStartsWith=\(name)"
        }
        let urlString = "\(baseURL)\(endPoint)?apikey=\(APIKeys.publicKey)&hash=\(APIKeys.md5)&ts=\(APIKeys.ts)\(pageParams)"
        return URL(string: urlString)
    }
    
}
