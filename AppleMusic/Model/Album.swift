//
//  Album.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/6/21.
//

import Foundation

struct Album: Decodable, Identifiable {
    var id: String
    var isFavorited: Bool = false
    let artistName: String
    let name: String
    let contentAdvisoryRating: String?
    let artworkUrl100: String
    let url: String
}
