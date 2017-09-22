//
//  PublicFeedRequest.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 22.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

enum PublicFeedRequest {
    case feed
}

extension PublicFeedRequest: Request {
    
    var path: String {
        switch self {
        case .feed:
            return "services/feeds/photos_public.gne"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .feed:
            return .get
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .feed:
            return .url([
                "format": "json"
                ])
        }
    }
}
