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
                .resizable()
                .frame(height: 260)
                .cornerRadius(1)
                
            // Need to handle cases with no description
            Text(character.description ?? "Not Found")
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .padding()
            
            Spacer()
            
    
        }
        .navigationTitle(character.name ?? "No name found")
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
