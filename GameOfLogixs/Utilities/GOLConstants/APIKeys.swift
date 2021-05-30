//
//  APIKeys.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import SwiftUI
import CryptoKit


enum APIKeys {
    static let publicKey = "f0bb483a30ebbbaf462d7a831fcac9ef"
    static let privateKey = "f81b6052bc2e53cda914d782ad2f4fa6e7daa7ea"
    static let ts = String(Date().timeIntervalSince1970)
    
    static var md5: String {
        let digest = Insecure.MD5.hash(data: "\(ts)\(privateKey)\(publicKey)".data(using: .utf8) ?? Data())
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
