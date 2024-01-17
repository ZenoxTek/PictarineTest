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
        VStack(alignment: .leading) {
            Text("Test Cell")
                .font(.largeTitle)
                .bold()
            Text(movie.title)
                .font(.title)
                .bold()
            .foregroundStyle(.primary)
        }
    }
}

#Preview {
    MovieCell(movie: MockData.sampleMovie)
}
