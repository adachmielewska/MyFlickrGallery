//
//  Post+Equatable.swift
//  MyFlickrGalleryTests
//
//  Created by Ada Chmielewska on 23.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation
@testable import MyFlickrGallery

extension Post: Equatable {
    
    public static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.title == rhs.title &&
            lhs.author == rhs.author &&
            lhs.tags == rhs.tags &&
            lhs.imageURL == rhs.imageURL &&
            //lhs.description == rhs.description &&
            lhs.createdDate == rhs.createdDate &&
            lhs.publishedDate == rhs.publishedDate
    }
}
