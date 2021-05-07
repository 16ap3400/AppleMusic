//
//  Album.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/6/21.
//

import Foundation

struct Album: Decodable, Identifiable {
    var id: String
    let artistName: String
    let name: String
//    let contentAdvisoryRating: String
    let artworkUrl100: String
}
