//
//  XButton.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import SwiftUI

struct XButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 32, height: 32)
                .tint(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .tint(.black)
        }
    }
}

#Preview {
    XButton()
}
