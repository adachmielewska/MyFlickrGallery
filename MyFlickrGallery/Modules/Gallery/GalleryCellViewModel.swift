//
//  GalleryCellViewModel.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

class GalleryCellViewModel {
    
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var title: String {
        return post.title
    }
    
    var author: String {
        return post.author
    }
    
    var imageURL: URL? {
        return URL(string: post.imageURL)
    }
    
    var tags: String {
        return post.tags
            .map { "#\($0)" }
            .joined(separator: " ")
    }
    
    var takenAt: String {
        return "Taken at \(DateFormatter.dateMedium.string(from: post.takenDate))"
    }
    
    var publishedAt: String {
        return "Published at \(DateFormatter.dateMedium.string(from: post.publishedDate))"
    }
}
