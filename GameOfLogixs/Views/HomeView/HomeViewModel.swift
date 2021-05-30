//
//  HomeViewModel.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import SwiftUI
import CryptoKit
import Combine


final class HomeViewModel: ObservableObject {
    
    @Published var fetchedCharacters: [Character] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    @Published  var isShowingDetail = false
    @Published  var selectedCharacter: Character?
    

    func getCharacters() {
        isLoading.toggle()
        NetworkManager.shared.getCharacters { [self] result in
            DispatchQueue.main.async {
                isLoading.toggle()
                switch result {
                case .success(let characters):
                    self.fetchedCharacters = characters
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}


