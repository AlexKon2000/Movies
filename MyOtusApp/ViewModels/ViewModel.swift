//
//  ViewModel.swift
//  MyOtusApp
//
//  Created by Alex on 06.03.2023.
//

import SwiftUI

class ViewModel: ObservableObject {

    @Published private(set) var movies: [Movie] = []

    func fetchList() {
        NetworkService.shared.fetch(urlString: Constants.top250urlString) { [weak self] (result: Result<Movies, APIError>) in
            switch result {
            case let .success(data):
                self?.movies = data.items
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}

private enum Constants {
    static let top250urlString = "https://imdb-api.com/en/API/Top250Movies/\(Constants.key)"
    static let key = "k_bi5qa1g7"
}
