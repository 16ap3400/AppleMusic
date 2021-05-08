//
//  RSSViewModel.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/6/21.
//

import Foundation
import Alamofire

class AlbumViewModel: ObservableObject {
    
    @Published var albums: [Album] = [Album]()
    @Published var explicit: Bool = true
    
    private let dataService: DataService
    
    init(dataService: DataService = DataService()) {
        self.dataService = dataService
    }
    
    func handleOnAppear() {
        dataService.fetchAlamoFire(url:  "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/explicit.json") { albums in
            self.albums = albums!
        }
        
//        dataService.fetchURLSession(url: URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/explicit.json")!) { albums in
//            self.albums = albums!
//        }
    }
}
