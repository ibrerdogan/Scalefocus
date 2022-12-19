//
//  EditMovies.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 15.12.2022.
//

import SwiftUI

struct EditMovieView: View {
    @StateObject var editMovieManager : EditMovieViewModel
    @EnvironmentObject var stateManager : StateManager
    @ObservedObject var keyboardResponder = KeyboardResponder()
    @Environment(\.presentationMode) var presentationMode
    @State var errorDisplay : Bool = false
    @State var errorText : String = ""
    
    
    
    init(_ movie : MovieModel)
    {
        _editMovieManager = StateObject(wrappedValue: EditMovieViewModel(movie))
    }
    
    var body: some View {
        VStack{
            ZStack(alignment:.leading){
                HStack{
                    Button {
                        withAnimation {
                            presentationMode.wrappedValue.dismiss()
                           
                        }
                    } label: {
                        HStack{
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .padding(.horizontal)
                       
                        
                    }

                }
                HStack{
                    Spacer()
                    Text("Edit")
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .HeaderViewStyle()
            MovieGridViewCell(movieImageStrint: editMovieManager.editMovie.moviePosterName)
            
            
            VStack(spacing:8){
                TextField("Title", text: $editMovieManager.editMovie.movieTitle )
                    .RoundedTextFieldStyle(backGroundColor: .gray)
                    .disabled(true)
                TextField("Relase Year", text: $editMovieManager.editMovie.movieRelaseYear )
                    .RoundedTextFieldStyle(backGroundColor: .gray)
                    .disabled(true)
                TextField("Genre", text: $editMovieManager.editMovie.movieGenre)
                    .RoundedTextFieldStyle(backGroundColor: .white)
                    .disabled(true)
                    .contextMenu{
                        ForEach(Genre.allCases){genre in
                            Button {
                                editMovieManager.editMovie.movieGenre = genre.name()
                            } label: {
                                Text(genre.name())
                            }

                        }
                    }
                TextField("Short Description", text: $editMovieManager.editMovie.movieShortDescription )
                    .RoundedTextFieldStyle(backGroundColor: .white)
                
                ZStack(alignment:.topLeading){
             
                    TextEditor(text: $editMovieManager.editMovie.movieLongDescription)
                        .TextEditorStyle(height:UIScreen.main.bounds.height * 0.1)
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
             
                        }
                    //MARK: TextEditor placeholder
                    if editMovieManager.editMovie.movieLongDescription.isEmpty
                    {
                        Text("Long Description")
                            .foregroundColor(.gray.opacity(0.7))
                            .padding()
                            .allowsHitTesting(false)
                            
                    }
                }
                Button {
                    editMovieManager.editMovieCheckFields { isOk, messageText in
                        if !isOk
                        {
                            errorText = messageText
                            errorDisplay = true
                        }
                        else
                        {
                            editMovieManager.edit()
                            presentationMode.wrappedValue.dismiss()
                            stateManager.showDetailscreen = false
                        }
                    }
                   
                } label: {
                    Text("Edit Movie")
                        .RoundedLongButtonStyle(backGroundColor: Color("IntoScreenButtonColor"), width: UIScreen.main.bounds.width)
                }

                   
            }
        
            Spacer()
        }
        .offset(y: -keyboardResponder.currentHeight*0.5)
        .navigationBarHidden(true)
        .background(.black)
        .alert(isPresented: $errorDisplay) {
            Alert(title: Text("Important message"), message: Text(errorText), dismissButton: .default(Text("OK")))
                }
        
    }
}

struct EditMovies_Previews: PreviewProvider {
    static var previews: some View {
        EditMovieView(MovieModel.example())
    }
}
