//
//  MovieCell.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            MovieAsyncImage(imageURL: movie.posterURL, imageType: .small)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title)
                    .bold()
                HStack {
                    Text(movie.retrieveYearDate())
                        .font(.caption)
                        .bold()
                    .foregroundStyle(.primary)
                    
                    Text("|")
                    
                    Text("\(String(format: "%.2f", movie.popularity)) %")
                }
                
                HStack {
                    
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    
                    Text("\(String(format: "%.2f", movie.voteAverage)) / 10")
                }
            }
        }
    }
}

#Preview {
    MovieCell(movie: MockData.sampleMovie)
}
