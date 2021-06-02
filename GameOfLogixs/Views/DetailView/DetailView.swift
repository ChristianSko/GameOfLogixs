//
//  DetailView.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import SwiftUI

struct DetailView: View {
    
    let character: Character
    
    var body: some View {
        VStack{
            Text(character.name ?? "Not Found")
                .font(.title)
            
            Text(character.description ?? "Not Found")
                .font(.body)
        }
        .navigationTitle("🤓Details🤓")
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
