//
//  File.swift
//  Hacker News
//
//  Created by Itay Garbash on 21/01/2020.
//  Copyright © 2020 Lazy Bear Apps. All rights reserved.
//

import Foundation

    class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    let frontPageURLtrail = "search?tags=front_page"
    
    func getFrontNews() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                            self.posts = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                        
                }
            }
            task.resume()
        }
    }
    
/*
        func parseJSON(data: Data) -> [Hits]? {
        let decoder = JSONDecoder()
        do {
            let parsedData = try decoder.decode(NewsModel.self, from: data)
/*
            let id = parsedData.result[0].id
            let title = parsedData.result[0].title
            let url = parsedData.result[0].title
            let score = parsedData.result[0].points
            
            let parsedNews = Hits(title: title, points: score, objectID: id, url: url)
*/
            posts = parsedData.result
            return posts
            
        } catch {
            print("error parsing JSON - \(error)")
            return nil
        }
    }
*/
}
