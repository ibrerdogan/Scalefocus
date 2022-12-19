//
//  AddMovieScreen.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 17.12.2022.
//

import SwiftUI

struct AddMovieView: View {
    
    @EnvironmentObject var stateManager : StateManager
    @ObservedObject var addMovieManager = AddMovieViewModel()
    @ObservedObject var keyboardResponder = KeyboardResponder()
  
    
    var body: some View {
        VStack{
            ZStack(alignment:.leading){
                HStack{
                    Button {
                        stateManager.showAddScreen = false
                    } label: {
                        VStack{
                            Circle()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(Color("barButtoncolor"))
                                .overlay {
                                    Image(systemName: "multiply")
                                }
                        }
                        .padding()
                    }

                }
                HStack{
                    Spacer()
                    Text("Add")
                    Spacer()
                }
                
                
                
            }
            .HeaderViewStyle()
            
            Button {
                addMovieManager.movie.moviePosterName = addMovieManager.getRandomMoviePoster()
            } label: {
               if addMovieManager.movie.moviePosterName == ""
                {
                   Rectangle()
                       .foregroundColor(.white)
                       .ImageHolderFrameStyle()
                       .overlay {
                           Text("Tap Me :)")
                               .font(.system(size: 60))
                               .tint(.black)
                       }
               }
                else
                {
                    MovieGridViewCell(movieImageStrint: addMovieManager.movie.moviePosterName)
                }
            }
            
          /**
           .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
           */
            
             VStack{
                 TextField("Title", text: $addMovieManager.movie.movieTitle)
                     .RoundedTextFieldStyle(backGroundColor: .white)
                     
                 TextField("Relase Year", text: $addMovieManager.movie.movieRelaseYear)
                     .RoundedTextFieldStyle(backGroundColor: .white)
                     .disabled(true)
                     .onTapGesture {
                         addMovieManager.showPicker.toggle()
                     }
                 if addMovieManager.showPicker {
                     DatePicker("", selection: $addMovieManager.date, displayedComponents: .date)
                         .datePickerStyle(.automatic)
                         .colorScheme(.dark)
                         .labelsHidden()
                         .onChange(of: addMovieManager.date) { newValue in
                             addMovieManager.movie.movieRelaseYear = newValue.getFormattedDate(format: "yyyy")
                             addMovieManager.showPicker.toggle()
                         }
                         
                 }
                 
                 TextField("Short Description", text: $addMovieManager.movie.movieShortDescription)
                 .RoundedTextFieldStyle(backGroundColor: .white)
                 
                 TextField("Genre", text: $addMovieManager.movie.movieGenre)
                     .RoundedTextFieldStyle(backGroundColor: .white)
                     .disabled(true)
                     .contextMenu{
                         ForEach(Genre.allCases){genre in
                             Button {
                                 addMovieManager.movie.movieGenre = genre.name()
                             } label: {
                                 Text(genre.name())
                             }

                         }
                   }
                 
               
                 ZStack(alignment:.topLeading){
              
                     TextEditor(text: $addMovieManager.movie.movieLongDescription)
                         .TextEditorStyle(height:UIScreen.main.bounds.height * 0.1)
                         .onTapGesture {
                             UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
              
                         }
                     //MARK: TextEditor placeholder
                     if addMovieManager.movie.movieLongDescription.isEmpty
                     {
                         Text("Long Description")
                             .foregroundColor(.gray.opacity(0.7))
                             .padding()
                             .allowsHitTesting(false)
                             
                     }
                 }
                 Button {
                     addMovieManager.addMovieCheckFields { (fieldsOk, messageText) in
                         if !fieldsOk
                         {
                             addMovieManager.errorDisplay = true
                             addMovieManager.errorText = messageText
                         }
                         else
                         {
                             addMovieManager.addNewMovie()
                             stateManager.showAddScreen = false
                             if stateManager.showListScreen == false
                             {
                                 stateManager.showListScreen = true
                             }
                         }
                        
                     }
                    
                    
                 } label: {
                     Text("Add Movie")
                         .RoundedLongButtonStyle(backGroundColor: Color("addMovieButtonColor"),width: UIScreen.main.bounds.width)
                 }
                
                 
             }
            
            Spacer()
        }
        .background(.black)
        .offset(y: -keyboardResponder.currentHeight*0.5)
        .alert(isPresented: $addMovieManager.errorDisplay) {
            Alert(title: Text("Important message"), message: Text(addMovieManager.errorText), dismissButton: .default(Text("OK")))
                }

        
    }
}

struct AddMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
