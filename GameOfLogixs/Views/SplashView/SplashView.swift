//
//  SplashView.swift
//  GameOfLogixs
//
//  Created by Christian Skorobogatow on 31/5/21.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        Image("splash")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 150)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
