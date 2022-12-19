//
//  MovieListViewModel.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 15.12.2022.
//

import Foundation

class MovieListViewModel : ObservableObject
{
   
    
    let instance = MovieManager.shared
    
    func getMovieList()->[MovieModel]
    {
        var list = instance.movieList
        if list.count < 7{
            let item = MovieModel.example()
            list.append(item)
        }
       
        return list
    }
    
    
    
}
