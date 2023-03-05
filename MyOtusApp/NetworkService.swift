//
//  NetworkService.swift
//  MyOtusApp
//
//  Created by Alex on 06.03.2023.
//

import Foundation

enum APIError: Error {
    case unknown
    case invalidURL
    case invalidResponse
    case decodingError
}

final class NetworkService {
    static let shared = NetworkService()
    private init() {}

    func fetch<T: Decodable>(urlString: String, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.unknown))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data else {
                completion(.failure(.unknown))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}


