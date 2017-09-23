//
//  ServiceStub.swift
//  MyFlickrGalleryTests
//
//  Created by Ada Chmielewska on 23.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import SwiftyJSON
@testable import MyFlickrGallery

final class ServiceStub: Service {
    
    var jsonResponse: Any?
    
    init(serviceConfig: ServiceConfig) {
        
    }
    
    func execute(request: Request, onComplete: @escaping (Response) -> Void) {
        onComplete(Response.json(JSON(jsonResponse ?? "")))
    }
}
