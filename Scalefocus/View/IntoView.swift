//
//  IntoView.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 15.12.2022.
//

import SwiftUI

struct IntoView: View {
    @EnvironmentObject var stateManager : StateManager
    
    var body: some View {
        NavigationView {
            ZStack(alignment:.bottom){
                Image("into")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    NavigationLink(isActive: $stateManager.showListScreen) {
                        MovieListView()
                            .environmentObject(stateManager)
                    } label: {
                        Text("Show Movies")
                            .RoundedLongButtonStyle(backGroundColor: Color("IntoScreenButtonColor"),width: UIScreen.main.bounds.width * 0.9)
                    }
                    Button {
                        stateManager.showAddScreen = true
                    } label: {
                        Text("Add Movie")
                            .RoundedLongButtonStyle(backGroundColor: Color("IntoScreenButtonColor"),width: UIScreen.main.bounds.width * 0.9)
                    }


                }
                .padding()
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $stateManager.showAddScreen) {
            AddMovieView()
                .environmentObject(stateManager)
        }
       
        
    }
}

struct IntoView_Previews: PreviewProvider {
    static var previews: some View {
        IntoView()
            .environmentObject(StateManager())
    }
}
