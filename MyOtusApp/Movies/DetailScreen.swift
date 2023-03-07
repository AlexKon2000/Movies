//
//  DetailScreen.swift
//  MyOtusApp
//
//  Created by Alex on 07.03.2023.
//

import SwiftUI

struct DetailScreen: View {

    let item: Movie

    var body: some View {
        VStack {
            Text(item.title)
                .font(.title)

            HStack {
                AsyncImage(url: URL(string: item.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.white
                }
                .frame(width: 128, height: 176)
                .clipShape(RoundedRectangle(cornerRadius: 5))

                VStack {
                    HStack {
                        Text("год выпуска:")
                        Text(item.year)
                        Spacer()
                    }

                    HStack {
                        Text(item.crew)
                        Spacer()
                    }

                    HStack {
                        Text("рейтинг:")
                        Text(item.imDbRating)
                        Spacer()
                    }
                }
            }
        }
        .padding()
    }
}
