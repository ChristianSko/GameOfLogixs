//
//  CharacterView.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import SwiftUI

struct CellView: View {
    
    let character: Character
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            
            Image("ironman")
                .resizable()
                .renderingMode(.original)
                .frame(width: .infinity, height: 250)
            
            Text(character.name ?? "Unknown")
                .foregroundColor(.primary)
                .font(.title)
                .padding()
        }
    }
}
