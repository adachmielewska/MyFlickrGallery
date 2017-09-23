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
    static func parse(json: JSON) -> Output
}

struct Post {
    
    let title: String
    let author: String
    let tags: [String]
    let imageURL: String
    //let description: String
    let createdDate: Date
    let publishedDate: Date
    
    init(title: String, author: String, tags: [String], imageURL: String, createdDate: Date, publishedDate: Date) {
        self.title = title
        self.author = author
        self.tags = tags
        self.imageURL = imageURL
        self.createdDate = createdDate
        self.publishedDate = publishedDate
    }
}

extension Post: Parser {
    typealias Output = Post
    
    static func parse(json: JSON) -> Post {
        let title = json["title"].stringValue
        let author = parseAuthorName(author: json["author"].stringValue)
        let tags =  separateTags(from: json["tags"].stringValue)
        let imageURL = json["media"]["m"].stringValue
        let createdDate = parseDate(string: json["date_taken"].stringValue)
        let publishedDate = parseDate(string: json["published"].stringValue)
        return Post(title: title, author: author, tags: tags, imageURL: imageURL, createdDate: createdDate, publishedDate: publishedDate)
    }
    
    private static func parseAuthorName(author: String) -> String {
        guard let emailRange = author.range(of: "nobody@flickr.com (\""), let closingBracketRange = author.range(of: "\")", options: .backwards) else { return author }
        return author
            .replacingCharacters(in: closingBracketRange, with: "")
            .replacingCharacters(in: emailRange, with: "")
    }

    private static func separateTags(from tags: String) -> [String] {
        guard !tags.isEmpty else { return [] }
        return tags.components(separatedBy: " ")
    }
    
    private static func parseDate(string: String) -> Date {
        guard let date =  ISO8601DateFormatter().date(from: string) else { return Date.distantPast}
        return date
    }
}
