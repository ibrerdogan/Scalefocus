//
//  MovieDetailView.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 15.12.2022.
//

import SwiftUI

struct MovieDetailView: View {
    var movie : MovieModel
    @EnvironmentObject var stateManager : StateManager
    @ObservedObject var movieDetailManager = MovieDetailViewModel()
    
    var body: some View {
       
        NavigationView {
            VStack{
                ZStack(alignment:.leading){
                    HStack{
                        Button {
                            withAnimation {
                                stateManager.showDetailscreen = false
                            }
                        } label: {
                            Circle()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(Color("barButtoncolor"))
                                .overlay {
                                    Image(systemName: "multiply")
                                       
                                }
                        }

                    }
                    HStack{
                        Spacer()
                        NavigationLink {
                            EditMovieView(movie)
                        } label: {
                            Text("Edit")
                                .padding(.horizontal)
                        }

                        Button {
                            movieDetailManager.deleteMovie(movie: movie)
                            withAnimation {
                                stateManager.showDetailscreen = false
                            }
                        } label: {
                            Image(systemName: "trash")
                                .font(.system(size: 30).bold())
                                .foregroundColor(.purple)
                        }

                       
                    }
                    
                    
                    
                }
                .padding()
                .HeaderViewStyle()
                MovieGridViewCell(movieImageStrint: movie.moviePosterName)
                Spacer()
                
                
                
                VStack(spacing:20){
                    MovieDetailRow(rowTitle: "Title :", rowDefinition: movie.movieTitle)
                    MovieDetailRow(rowTitle: "Year :", rowDefinition: movie.movieRelaseYear)
                    MovieDetailRow(rowTitle: "Genre :", rowDefinition: movie.movieGenre)
                    MovieDetailRow(rowTitle: "Short Description :", rowDefinition: movie.movieShortDescription)
                    MovieDetailRow(rowTitle: "Long Description :", rowDefinition: "")
                    
                    VStack{
                        Text(movie.movieLongDescription)
                            .multilineTextAlignment(.leading)
                            .padding()
                            
                    }.frame(width: UIScreen.main.bounds.width - 10)
                        .border(.white, width: 2)
                    
                    
                }.font(.system(size: 20))
                    .foregroundColor(.white)
                Spacer()
                

            }
            .background(.black)
            .navigationBarHidden(true)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: MovieModel.example())
    }
}





