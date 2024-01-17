//
//  MovieAsyncImage.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import SwiftUI

struct MovieAsyncImage: View {
    
    let imageURL: URL?
    let imageType: Image.MovieType
    
    var body: some View {
        Group {
            if let imageURL {
                AsyncImage(url: imageURL as URL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.imageStyle(of: imageType)
                    case .failure:
                        Image("food-placeholder").imageStyle(of: imageType)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "movieclapper.fill").imageStyle(of: imageType)
            }
        }
    }
}
