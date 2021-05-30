//
//  HomeView.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        NavigationView{
            List(homeData.fetchedCharacters) { character in
                CellView(character: character)
            }
        }
        .onAppear{
            homeData.getCharacters()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Marvel Characters")
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




