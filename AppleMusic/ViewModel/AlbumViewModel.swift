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
    
    
    func fetchTopAlbums() {
        
            // To choose explicit vs non-explicit
        var contentType: String
        if explicit {
            contentType = "explicit"
        } else {
            contentType = "non-explicit"
        }
        
            // fetch data
        if let url  = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/" + contentType + ".json") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let response = try decoder.decode(Response.self, from: safeData)
                            DispatchQueue.main.async {
                                print("Results \n \(response.feed.results)")
                                self.albums = response.feed.results
                            }
                        } catch {
                            print("Decoder Failed \n")
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }

    func fetchAlamoFire() {
        let request = AF.request("https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/explicit.json")
        request.validate()
        request.responseDecodable(of: Response.self) { (response) in
            guard let root = response.value else {return}
            self.albums = root.feed.results
            print(root.feed.results[0])
        }
    }
}
