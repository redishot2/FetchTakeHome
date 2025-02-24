//
//  URLSelectionButton.swift
//  FetchApp
//
//  Created by Natasha Martinez on 2/24/25.
//

import SwiftUI

struct URLSelectionButton: View {
    let onPressed: (Networking.URLInfo) -> Void
    
    var body: some View {
        Menu {
            ForEach(Networking.URLs.all, id: \.self) { urlInfo in
                Button(urlInfo.name) {
                    onPressed(urlInfo)
                }
            }
        } label: {
            Image(systemName: "network")
                .foregroundStyle(Color.black)
        }
        .frame(alignment: .trailing)
    }
}

#Preview {
    URLSelectionButton(onPressed: { _ in })
}
