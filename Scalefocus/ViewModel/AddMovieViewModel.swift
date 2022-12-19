//
//  AddMovieViewModel.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 15.12.2022.
//

import Foundation
import Combine

class AddMovieViewModel : ObservableObject
{
    @Published var movie = MovieModel.example()
    @Published var showPicker : Bool = false
    @Published var date : Date = Date.now
    @Published var errorDisplay : Bool = false
    @Published var errorText : String = ""
    
    
    let movieManagerInstance = MovieManager.shared
    
    
    /// For check all fields are proper..
    /// - Parameter completionHandler: after check, if there is a improper field, isOk will return true and errorText contains detail
    func addMovieCheckFields(completionHandler: @escaping (_ isOk : Bool , _ errorText : String) -> ())
    {
        movieManagerInstance.checkAllFieldsProper(movie: movie, completionHandler: completionHandler)
    }
    
   
    
    /// add movie, after fields control
    func addNewMovie()
    {
        movieManagerInstance.addNewMovie(movie)
    }
    
    
    /// get random movie poster, for add movie,
    /// - Returns: random movie poster name
    func getRandomMoviePoster() -> String
    {
        return movieManagerInstance.getRandomPoster()
       
    }
    
    
}
