//
//  NewsModel.swift
//  Hacker News
//
//  Created by Itay Garbash on 21/01/2020.
//  Copyright © 2020 Lazy Bear Apps. All rights reserved.
//

import Foundation

struct Results: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    
    var id: String {
        return objectID
    }
    
    let title: String
    let points: Int
    let objectID: String
    let url: String?
}
