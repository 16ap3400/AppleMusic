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



struct RSSViewModel {
    
    init() {
        fetch()
    }
    
    func fetch() {
        AF.request("https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/explicit.json").response { response in
            debugPrint(response)
        }
    }
}

//    func getRSSFeedResponse(path: String, completionHandler: @escaping(_
//        response: RSSFeed?,_ status: NetworkResponseStatus) -> Void) {
//        AF.request(path).responseRSS() { response in
//            switch response.result {
//            case .success(let value):
//                print("Contents: \(response.data!)")
//                print("Result: \(response.result)")
//                completionHandler(value, .success)
//            case .failure(let error):
//                print("Error in response: \(error)")
//                completionHandler(nil, .error(string: response.error?.localizedDescription))
//            }
//        }
//    }
