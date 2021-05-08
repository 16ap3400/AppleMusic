//
//  DataService.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/8/21.
//

import Foundation

class DataService {
    func loadTopHeadlines(url: URL, completion: @escaping ([Album]?) -> ()) {
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode(Response.self, from: data)
            if let response = response {
                DispatchQueue.main.async {
                    completion(response.feed.results)
                }
            }
            
            
        }.resume()
        
    }
}
