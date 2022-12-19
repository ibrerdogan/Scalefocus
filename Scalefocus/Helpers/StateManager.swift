//
//  NavigationModel.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 15.12.2022.
//

import Foundation

//MARK: i used the state manager for navigation programmaticaly.

class StateManager : ObservableObject
{
    @Published var showAddScreen : Bool = false
    @Published var showListScreen : Bool = false
    @Published var showDetailscreen : Bool = false
    
}


