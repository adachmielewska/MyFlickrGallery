//
//  Service.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 22.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

protocol Service {
    
    init(serviceConfig: ServiceConfig)
    func execute(request: Request, onComplete: @escaping (Response) -> Void)
}
