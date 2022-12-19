//
//  EditMovieViewModel.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 16.12.2022.
//

import Foundation


class EditMovieViewModel : ObservableObject
{
    @Published var editMovie : MovieModel
    let ins = MovieManager.shared
    
    init(_ movie : MovieModel)
    {
        editMovie = movie
    }
    
    func edit()
    {
        ins.editMovie(movie: editMovie)
    }
    
    func editMovieCheckFields(completionHandler: @escaping (_ isOk : Bool , _ errorText : String) -> ())
    {
        ins.checkAllFieldsProper(movie: editMovie, completionHandler: completionHandler)
    }
    
    
 
}
