//
//  Response.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 22.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation
import SwiftyJSON

enum Response {
    case json(_: JSON)
    case error(_: Int?, _: Error?)
    
    init(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?), for request: Request) {
        guard response.r?.statusCode == 200, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        guard let data = response.data else {
            self = .error(nil, nil)
            return
        }
        self = .json(JSON(data: data))
    }
}
