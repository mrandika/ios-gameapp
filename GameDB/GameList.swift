//
//  GameList.swift
//  GameDB
//
//  Created by Andika on 03/01/20.
//  Copyright © 2020 Andika. All rights reserved.
//

import Foundation

class GameList: ObservableObject {
    @Published var games: [Game] = []
    @Published var isLoading = false
    
    var gameService = GameStore.shared
    
    func reload(platform: Platform = .ps4) {
        self.games = []
        self.isLoading = true
        
        gameService.fetchPopularGames(for: platform) { [weak self] (result) in
            self?.isLoading = false
            
            switch result {
            case .success(let games):
                self?.games = games
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
