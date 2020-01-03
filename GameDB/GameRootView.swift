//
//  GameRootView.swift
//  GameDB
//
//  Created by Andika on 03/01/20.
//  Copyright © 2020 Andika. All rights reserved.
//

import SwiftUI

struct GameRootView: View {
    var body: some View {
        TabView {
            ForEach(Platform.allCases, id: \.self) { p in
                GameListView(platform: p).tag(p)
                    .tabItem {
                        Image(p.assetName)
                        Text(p.description)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct GameRootView_Previews: PreviewProvider {
    static var previews: some View {
        GameRootView()
    }
}
