//
//  Character.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import SwiftUI


struct APIResult: Decodable {
    var data: APICharacterData
}

struct APICharacterData: Decodable {
    var count: Int
    var results: [Character]
}

struct Character: Identifiable, Codable {

    public let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?

}

struct Thumbnail: Codable {
    let path: String
    let ext: String

    public init(
        path: String,
        ext: String
    ) {
        self.path = path
        self.ext = ext
    }

    private enum CodingKeys : String, CodingKey {
        case path, ext = "extension"
    }

    var url: URL { return URL(string: "\(path)/standard_xlarge.\(ext)")! }
}



