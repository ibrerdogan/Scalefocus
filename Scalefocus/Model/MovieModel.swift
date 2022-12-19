//
//  MovieModel.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 14.12.2022.
//

import Foundation

struct MovieModel : Identifiable
{
    var id = UUID().uuidString
    var moviePosterName : String
    var movieTitle : String
    var movieRelaseYear : String
    var movieShortDescription : String
    var movieGenre : String
    var movieLongDescription : String
    
    
    static func example() -> MovieModel
    {
        return MovieModel(moviePosterName: "", movieTitle: "", movieRelaseYear: "2000", movieShortDescription: "", movieGenre: "", movieLongDescription: "")
    }
}


enum Genre : String , CaseIterable , Identifiable
{
   
    case horror
    case comedy
    case history
    case western
    case drame
    case adveture
    
    var id : String {
        return self.rawValue
    }
    
    func name()-> String{
        switch self {
        case .horror:
            return "Horror"
        case .comedy:
            return "Comedy"
        case .history:
            return "History"
        case .western:
            return "Western"
        case .drame:
            return "Drama"
        case .adveture:
            return "Adventure"
        }
    }
}


