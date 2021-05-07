//
//  AlbumViewModel.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/7/21.
//

import Foundation

struct AlbumViewModel {
    
    let album: Album
    
    var imageURL: String {
        return self.album.artworkUrl100
    }
    
    var name: String {
        return self.album.name
    }
    
    var artistName: String {
        return self.album.artistName
    }
    
//    var rating: String {
//        return self.album.contentAdvisoryRating
//    }
    
}
