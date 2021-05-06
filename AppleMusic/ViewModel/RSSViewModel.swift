//
//  RSSViewModel.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/6/21.
//

import Foundation
import Alamofire
import AlamofireRSSParser

enum NetworkResponseStatus {
    case success
    case error(string: String?)
}

class RSSViewModel: ObservableObject {
    
    @Published var albums = [Album]()
    
    init() {
        fetch()
    }
    
    func fetch() {
        AF.request("https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/explicit.json").responseJSON{ response in
//            print("Value: \(response.value ?? "ERROR")")
            
            if let json = response.value {
                if  (json as? [String : AnyObject]) != nil{
                    if let dictionaryArray = json as? Dictionary<String, Dictionary<String, AnyObject?>> {
                        let jsonArray = dictionaryArray["feed"]!["results"]

                        if let jsonArray = jsonArray as? Array<Dictionary<String, AnyObject?>>{
                            for i in 0..<jsonArray.count{
                                print("\(i)th album: \n")
                                let json = jsonArray[i]
                                if let artistName = json["artistName"] as? String, let name = json["name"] as? String, let contentAdvisoryRating = json["contentAdvvisoryRating"] as? String, let artURL = json["artworkUrl100"] as? String {
                                self.albums.append(Album(artistName: artistName, name: name, contentAdvisoryRating: contentAdvisoryRating, artURL: artURL))
                                }
                                if self.albums.count > 0 {
                                    print(self.albums[self.albums.count-1].artistName)
                                }
                            }
                        }
                    }
                }
            }
        }
        print("Albums post request: \n")
        print(albums)
    }
}
