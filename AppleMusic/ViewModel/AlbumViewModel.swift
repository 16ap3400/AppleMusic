//
//  RSSViewModel.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/6/21.
//

import Foundation

class AlbumViewModel: ObservableObject {
    
    @Published var albums: [Album] = [Album]()
    
    func fetchTopAlbums() {
        if let url  = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/explicit.json") {
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
}
    
//    private func Alamofetch() {
//        AF.request("https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/explicit.json").responseJSON{ response in
////            print("Value: \(response.value ?? "ERROR")")
//
//            if let json = response.value {
//                if  (json as? [String : AnyObject]) != nil{
//                    if let dictionaryArray = json as? Dictionary<String, Dictionary<String, AnyObject?>> {
//                        let jsonArray = dictionaryArray["feed"]!["results"]!
//                        let data = response.data
//
////                        print(response.value)
//                        let json = try? JSONDecoder().decode(Feed.self, from: response.value as! Data)
//
//                        if let json = json {
//                            for i in 0..<json.results.count {
//                                print("\(i)th album: \n")
//                                if let artistName = json.results[i].artistName as? String, let name = json.results[i].name as? String, let contentAdvisoryRating = json.results[i].contentAdvisoryRating as? String, let artworkUrl100 = json.results[i].artworkUrl100 as? String {
//                                    self.albumList.append(Album(artistName: artistName, name: name, contentAdvisoryRating: contentAdvisoryRating, artworkUrl100: artworkUrl100))
//                                }
//                                if self.albums.count > 0 {
//                                    print(self.albums[self.albums.count-1].artistName)
//                                }
//                            }
//                        } else {
//                            print("Error decoding JSON")
//                            print(json)
//                        }
//
//
////                        if let jsonArray = jsonArray as? Array<Dictionary<String, AnyObject?>>{
////                            for i in 0..<jsonArray.count{
////                                print("\(i)th album: \n")
////
////                                let json = jsonArray[i]
////                                if let artistName = json["artistName"] as? String, let name = json["name"] as? String, let contentAdvisoryRating = json["contentAdvvisoryRating"] as? String, let artURL = json["artworkUrl100"] as? String {
////                                self.albums.append(Album(artistName: artistName, name: name, contentAdvisoryRating: contentAdvisoryRating, artURL: artURL))
////                                }
////                                if self.albums.count > 0 {
////                                    print(self.albums[self.albums.count-1].artistName)
////                                }
////                            }
////                        }
//                    }
//                }
//            }
//        }
//        print("Albums post request: \n")
//        print(albums)
//    }

