//
//  ContentView.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 14.12.2022.
//

import SwiftUI

struct MovieListView: View {
    @EnvironmentObject var stateManager : StateManager
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var selectedMovie = MovieModel.example()
    @ObservedObject var movieListManager = MovieListViewModel()
    
    
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
  
    var body: some View {
        VStack {
            
            //HEADER
            ZStack{
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack{
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .padding()
                    }
                    .contentShape(Rectangle())

                    Spacer()
                    Text("Movies")
                        .offset(x:-10)
                    Spacer()
                    Button {
                        stateManager.showAddScreen = true
                    } label: {
                        Image(systemName: "plus")
                            .padding()
                           
                    }
                    .contentShape(Rectangle())

                }
                .padding(.top,22)
                
                
            }
            .HeaderViewStyle()
           
            
            
            //MARK: display movies as a cell.
            VStack {
                ScrollView{
                    LazyVGrid(columns: columns) {
                        ForEach(movieListManager.getMovieList()){item in
                            if item.moviePosterName != ""{
                                Button {
                                    selectedMovie = item
                                    stateManager.showDetailscreen = true
                                   
                                } label: {
                                    MovieGridViewCell(movieImageStrint: item.moviePosterName)
                                       
                                      
                                }
                            }
                            else
                            {
                                Button {
                                    stateManager.showAddScreen = true
                                   
                                } label: {
                                    MovieGridViewCell(movieImageStrint: item.moviePosterName)
                                       
                                        
                                }
                            }



                               
                                
                        }
                    }
                }
                .navigationBarHidden(true)
                //i decided to build custom navigation bar.
            }
            .padding(.horizontal)
            .sheet(isPresented: $stateManager.showAddScreen) {
                AddMovieView()
                    .environmentObject(stateManager)
            }
            
        }
        .sheet(isPresented: $stateManager.showDetailscreen, content: {
            MovieDetailView(movie: selectedMovie)
                .environmentObject(stateManager)
        })
        .ignoresSafeArea()
        .background(.black)
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
            .environmentObject(StateManager())
      
      
    }
}
