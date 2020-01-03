//
//  GameDetail.swift
//  GameDB
//
//  Created by Andika on 03/01/20.
//  Copyright © 2020 Andika. All rights reserved.
//

import Foundation

class GameDetail: ObservableObject {
    
    @Published var game: Game? = nil
    @Published var isLoading = false
    
    var gameService: GameService = GameStore.shared
    
    func reload(id: Int) {
        self.isLoading = true
        self.gameService.fetchGame(id: id) { [weak self] (result) in
            self?.isLoading = false
            
            switch result {
            case .success(let game):
                self?.game = game
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
