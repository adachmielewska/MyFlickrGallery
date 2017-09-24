//
//  PublicFeedProvider.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

class PublicFeedProvider {
    
    let apiService: Service
    
    init(service: Service) {
        apiService = service
    }
    
    func getPublicFeed(onComplete: @escaping ([Post]) -> Void) {
        PostTask().execute(in: apiService, onComplete: { posts in
            onComplete(posts)
        }, onError: { code, error in
            print(error?.localizedDescription ?? "error")
        })
    }
}
