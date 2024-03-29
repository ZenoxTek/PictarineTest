//
//  MovieDetails.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @Binding var isPresentingCard: Bool
    
    var movie: Movie
    
    var body: some View {
        
        VStack {
            MovieAsyncImage(imageURL: movie.posterURL, imageType: .detail)
            
            VStack {
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(movie.overview)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    MovieInfo(title: "Popularity", value: "\(movie.popularity)")
                    
                    MovieInfo(title: "Rate", value: "\(movie.voteAverage) g")
                    
                    MovieInfo(title: "Release Date", value: "\(movie.retrieveYearDate())")
                }
            }
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
        .shadow(radius: 40)
    }
}

#Preview {
    MovieDetailsView(isPresentingCard: .constant(true),
                     movie: MockData.sampleMovie)
}

struct MovieInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .bold()
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
