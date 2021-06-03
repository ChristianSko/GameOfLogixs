//
//  DetailView.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    let character: Character
    
    var body: some View {
        VStack{
            
            WebImage(url: character.thumbnail?.url)
                
            
            Text(character.name ?? "Not Found")
                .font(.title)
            
            Text(character.description ?? "Not Found")
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .padding()
        }
        .navigationTitle("🤓Details🤓")
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
