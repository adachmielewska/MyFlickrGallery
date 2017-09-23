//
//  ServiceStub.swift
//  MyFlickrGalleryTests
//
//  Created by Ada Chmielewska on 23.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

@testable import MyFlickrGallery

class ServiceStub: Service {
    
    init(serviceConfig: ServiceConfig) {
        
    }
    
    func execute(request: Request, onComplete: @escaping (Response) -> Void) {
        
    }
}
