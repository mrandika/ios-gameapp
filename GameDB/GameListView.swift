//
//  GameListView.swift
//  GameDB
//
//  Created by Andika on 03/01/20.
//  Copyright © 2020 Andika. All rights reserved.
//

import SwiftUI

struct GameListView: View {
    
    @ObservedObject var gameList: GameList = GameList()
    var platform: Platform = .ps4
    
    var body: some View {
        NavigationView {
            Group {
                if self.gameList.isLoading {
                    LoadingView()
                } else {
                    List(self.gameList.games) { (game: Game) in
                        NavigationLink(destination: GameDetailView(gameId: game.id)) {
                            GameListRowView(game: game)
                        }
                    }
                }
            }
            .navigationBarTitle(self.platform.description)
        }.onAppear {
            if self.gameList.games.isEmpty {
                self.gameList.reload(platform: self.platform)
            }
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
