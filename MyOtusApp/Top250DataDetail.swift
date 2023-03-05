//
//  Top250DataDetail.swift
//  MyOtusApp
//
//  Created by Alex on 06.03.2023.
//

import Foundation

struct Top250DataDetail: Codable, Identifiable {
    let id: String
    let rank: String
    let title: String
    let fullTitle: String
    let year: String
    let image: String
    let crew: String
    let imDbRating: String
    let imDbRatingCount: String
}

struct Top250Movies: Codable {
    let items: [Top250DataDetail]
}
