//
//  SplashView.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 31/5/21.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive:Bool = false
    
    var body: some View {
        
        VStack {
            if self.isActive {
                HomeView()
            } else {
                Image("splash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 150)
                    .animation(.easeInOut(duration: 1.5))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
