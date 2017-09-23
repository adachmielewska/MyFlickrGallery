//
//  Post.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 23.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import SwiftyJSON

protocol Parser {
    
    associatedtype Output
    func parse(json: JSON) -> Output
}

struct Post {
    
    let title: String
    let author: String
    let tags: [String]
    let imageURL: String
    let description: String
    let createdDate: String
    let publishedDate: String
    
    init(json: JSON) {
        title = json["title"].stringValue
        author = json["author"].stringValue
        tags =  [""] //json["tags"].array
        imageURL = json["media"].stringValue
        description = json["description"].stringValue
        createdDate = json["date_taken"].stringValue
        publishedDate = json["published"].stringValue
    }
}

class PostListParser: Parser {
    
    typealias Output = [Post]
    
    func parse(json: JSON) -> [Post] {
        let items = json["items"].arrayValue
        return items.flatMap { Post(json: $0)}
    }
}
