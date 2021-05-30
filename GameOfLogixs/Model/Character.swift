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

struct Character: Identifiable, Decodable {
    
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String:String]
    var urls: [String: String]

}
