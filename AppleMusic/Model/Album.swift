//
//  Album.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/6/21.
//

import Foundation

struct Album: Decodable {
    let artistName: String
    let name: String
    let contentAdvisoryRating: String
    let artURL: String
}
