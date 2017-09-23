//
//  PostTask.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 23.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

class PostTask: Operation {
    
    typealias Output = [Post]
    
    var request: Request {
        return PublicFeedRequest.feed
    }
    
    func execute(in service: Service, onComplete: @escaping ([Post]) -> Void, onError: @escaping (Int?, Error?) -> Void) {
        service.execute(request: request, onComplete: { response in
            switch response {
            case let .json(json):
                onComplete(PostsListParser.parse(json: json))
            case let .error(code, error):
                onError(code, error)
            }
        })
    }
}
