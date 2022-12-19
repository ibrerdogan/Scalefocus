//
//  MovieGridViewCell.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 14.12.2022.
//

import SwiftUI

struct MovieGridViewCell: View {
    let movieImageStrint : String
    var body: some View {
        if movieImageStrint != ""{
                    Image(movieImageStrint)
                        .resizable()
                        .scaledToFill()
                        .ImageHolderFrameStyle()
                        .clipped()
                       
                        
           
        }
        else
        {
            VStack{
                Image(systemName: "plus")
                    .font(.system(size: 60).bold())
                    .foregroundColor(.white)
                    .ImageHolderFrameStyle()
                    
                    
            }
            .background(Color("addMovieCellViewBackground"))
            .cornerRadius(10)
        }
    }
}

struct MovieGridViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridViewCell(movieImageStrint: "")
          
            
            
    }
}
