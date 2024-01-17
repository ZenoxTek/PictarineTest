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
            AsyncImage(url: movie.posterURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                case .failure(_):
                    Text("Failed")
                        .font(.caption2)
                        .bold()
                case .empty:
                    ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                @unknown default:
                    Text("Failed")
                }
            }
            
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
