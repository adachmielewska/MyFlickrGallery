//
//  Assembly.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

enum Assemby {
    
    enum Dependencies {
        
        static var networkService: NetworkService {
            return NetworkService(serviceConfig: ServiceConfig())
        }
        
        static var publicFeedProvider: PublicFeedProvider {
            return PublicFeedProvider(service: networkService)
        }
    }
}
