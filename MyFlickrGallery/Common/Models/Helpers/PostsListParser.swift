//
//  PostsListParser.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 23.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation
import SwiftyJSON

class PostsListParser: Parser {
    
    typealias Output = [Post]
    
    static func parse(json: JSON) -> [Post] {
        let items = json["items"].arrayValue
        return items.flatMap { Post.parse(json: $0) }
    }
}
