//
//  Image+Ext.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import SwiftUI

extension Image {
    
    enum MovieType {
        case small, detail
    }
    
    func imageStyle(of type: MovieType) -> some View {
        Group{
            switch type {
            case .detail:
                detailImageStyle()
            case .small:
                smallImageStyle()
            }
        }
    }
    
    private func smallImageStyle() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 100, maxHeight: 100)
            .padding(.bottom)
    }
    
    private func detailImageStyle() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 300, maxHeight: 225)
            .padding(.bottom)
    }
}
