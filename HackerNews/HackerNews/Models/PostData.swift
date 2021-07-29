//
//  PostData.swift
//  HackerNews
//
//  Created by Raghav Sharma on 29/07/21.
//

import Foundation

struct PostData: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    let objectID: String
    var id: String {
        return objectID
    }
    let points: Int
    let title: String
    let url: String?
}
