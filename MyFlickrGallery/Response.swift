//
//  Response.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 22.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation
import SwiftyJSON

enum NetworkErrors: Error {
    case badInput
    case noData
}

enum Response {
    case json(_: JSON)
    case error(_: Int?, _: Error?)
    
    init(_ response: (response: HTTPURLResponse?, data: Data?, error: Error?), for request: Request) {
        guard response.response?.statusCode == 200, response.error == nil else {
            self = .error(response.response?.statusCode, response.error)
            return
        }
        guard let data = response.data else {
            self = .error(response.response?.statusCode, NetworkErrors.noData)
            return
        }
        self = .json(JSON(data))
    }
}
