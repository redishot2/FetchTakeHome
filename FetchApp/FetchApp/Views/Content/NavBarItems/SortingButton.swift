//
//  SortingButton.swift
//  FetchApp
//
//  Created by Natasha Martinez on 2/24/25.
//

import SwiftUI

struct SortingButton: View {
    let onPressed: (Sorting.SortType.SortTypes) -> Void
    
    var body: some View {
        Menu {
            ForEach(Sorting.SortType.SortTypes.all, id: \.self) { sortType in
                Button(sortType.rawValue) {
                    onPressed(sortType)
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .foregroundStyle(Color.black)
        }
        .frame(alignment: .trailing)
    }
}

#Preview {
    SortingButton(onPressed: { _ in })
}
