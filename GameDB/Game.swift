//
//  Game.swift
//  GameDB
//
//  Created by Andika on 03/01/20.
//  Copyright © 2020 Andika. All rights reserved.
//

import Foundation

extension Game: Identifiable {}

struct Game {
    let id: Int
    let name: String
    let storyline: String
    let summary: String
    
    let releaseDate: Date
    let popularity: Double
    let rating: Double
    let coverURLString: String
    let screenshotURLString: [String]
    let genres: [String]
    let company: String
    
    static let dateFormatter: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd/MM/YYYY"
        return formater
    }()
    
    var releaseDateText: String {
        return Game.dateFormatter.string(from: releaseDate)
    }
    
    var coverURL: URL? {
        return URL(string: coverURLString)
    }
    
    var genreText: String {
        return genres.joined(separator: ", ")
    }
    
    var screenshootURLs: [URL] {
        return screenshotURLString.compactMap { URL(string: $0) }
    }
}

