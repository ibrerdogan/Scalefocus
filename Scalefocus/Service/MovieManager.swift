//
//  MovieManager.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 15.12.2022.
//

import Foundation

class MovieManager : ObservableObject
{
    @Published var movieList : [MovieModel] = []
    private let moviePosters : [String] = ["imitation","maxtrix","prestige","sevent_seal","steve","theory_of_everything"]
    
    //MARK: create singleton instance :) 
    static let shared = MovieManager()
    
    
    func addNewMovie(_ movie : MovieModel)
    {
        movieList.append(movie)
    }
    
    func removeMovie(_ movie : MovieModel)
    {
        movieList.removeAll(where: {$0.id == movie.id})
    }
    
    func editMovie(movie : MovieModel)
    {
       if let row = movieList.firstIndex(where: {$0.id == movie.id}){
           movieList[row] = movie
        }
    }
    
    func getRandomPoster() -> String
    {
        return moviePosters.randomElement()!
    }
    
    func checkAllFieldsProper(movie : MovieModel,completionHandler: @escaping (_ isOk : Bool , _ errorText : String) -> ())
    {
        var messageString = ""
        if movie.movieTitle.count < 4
        {
            messageString += "Movie Title Should Be More Than 3 Character \n"
        }
        if movie.movieShortDescription.count < 4
        {
            messageString +=  "Movie Short Description Should Be More Than 3 Character \n"
        }
        if movie.movieLongDescription.count < 11
        {
            messageString +=  "Movie Long Description Should Be More Than 10 Character \n"
        }
        if movie.movieGenre == ""
        {
            messageString += "Movie Genre Didn't Select\n"
        }
        if movie.moviePosterName == "" || movie.moviePosterName.isEmpty
        {
            messageString += "Movie Poster Didn't Select\n"
        }
        if messageString != ""
        {
            completionHandler(false,messageString)
        }
        else
        {
            completionHandler(true,"")
        }
       
    }
}
