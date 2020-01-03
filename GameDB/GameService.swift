//
//  GameService.swift
//  GameDB
//
//  Created by Andika on 03/01/20.
//  Copyright © 2020 Andika. All rights reserved.
//

import Foundation

protocol GameService {
    func fetchPopularGames(for platform: Platform, completion: @escaping (Result<[Game], Error>) -> Void)
    func fetchGame(id: Int, completion: @escaping (Result<Game, Error>) -> Void)
}
