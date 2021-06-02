//
//  HomeView.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 30/5/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.fetchedCharacters) { character in
                    NavigationLink(
                        destination: DetailView(character: character)) {
                        CellView(character: character)
                    }
                }
                .listStyle(DefaultListStyle())
                .navigationTitle("🦸🏾‍♀️Characters🦸‍♂️")
            }
            .onAppear{
                viewModel.getCharacters()
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct CellView: View {
    
    let character: Character
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            
            WebImage(url: character.thumbnail?.url)
                .resizable()
                .renderingMode(.original)
                .frame(width: 400, height: 250)
            
            Text(character.name ?? "Unknown")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding()
        }
    }
}
