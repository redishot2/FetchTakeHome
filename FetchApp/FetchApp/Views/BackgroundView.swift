//
//  BackgroundView.swift
//  FetchApp
//
//  Created by Natasha Martinez on 2/24/25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color.customColorLight, Color.customColorMedium]), startPoint: .bottomLeading, endPoint: .topTrailing)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView()
}
