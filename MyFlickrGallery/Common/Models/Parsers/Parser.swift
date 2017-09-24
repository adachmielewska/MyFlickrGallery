//
//  Parser.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import SwiftyJSON

protocol Parser {
    
    associatedtype Output
    static func parse(json: JSON) -> Output
}
