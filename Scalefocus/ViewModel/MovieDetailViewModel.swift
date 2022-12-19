//
//  MovieDetailViewModel.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 16.12.2022.
//

import Foundation


class MovieDetailViewModel : ObservableObject
{
    let ins = MovieManager.shared
    func deleteMovie(movie : MovieModel)
    {
        ins.removeMovie(movie)
    }
    
}
