//
//  ListScreen.swift
//  MyOtusApp
//
//  Created by Alex on 07.03.2023.
//

import SwiftUI

struct ListScreen: View {

    @ObservedObject var viewModel: ViewModel
    @Binding var detailNumber: Int?

    var body: some View {
        let indices = viewModel.movies.enumerated().map { $0 }

        NavigationView {
            List(indices, id: \.element.id) { index, item in
                NavigationLink(
                    destination: DetailScreen(item: item),
                    tag: index,
                    selection: $detailNumber
                ) {
                    ListItem(item: item)
                }

            }
            .navigationTitle(Text("Top 250 IMDB Movies"))
            .onAppear {
                loadData()
            }
            .refreshable {
                loadData()
            }
        }
    }

    private func loadData() {
        viewModel.fetchList()
    }
}
