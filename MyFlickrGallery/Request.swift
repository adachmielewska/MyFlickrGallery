//
//  Request.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 22.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum RequestParams {
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
}

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParams { get }
}
