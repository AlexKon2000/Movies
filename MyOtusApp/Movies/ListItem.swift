//
//  ListItem.swift
//  MyOtusApp
//
//  Created by Alex on 07.03.2023.
//

import SwiftUI

struct ListItem: View {

    let item: Movie

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .frame(width: 64, height: 88)
            .clipShape(RoundedRectangle(cornerRadius: 5))

            Text(item.title)
        }
    }
}
