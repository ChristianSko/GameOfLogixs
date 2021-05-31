//
//  LoadingView.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 31/5/21.
//

import SwiftUI


struct LoadingView: View {
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
        }
     
        ProgressView("Loading...")
            .progressViewStyle(CircularProgressViewStyle(tint: .primary))
            .scaleEffect(2)
    }
}
