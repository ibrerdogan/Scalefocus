//
//  ScalefocusApp.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 14.12.2022.
//

import SwiftUI

@main
struct ScalefocusApp: App {
    
    
    var body: some Scene {
        WindowGroup {
           
                IntoView()
                .preferredColorScheme(.light)
                .environmentObject(StateManager())
       
        }
    }
}
