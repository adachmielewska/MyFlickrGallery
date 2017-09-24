//
//  ServiceConfig.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 22.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

struct ServiceConfig {
    
    var baseUrl: String = Bundle.main.object(forInfoDictionaryKey: "Config") as? String ?? ""
}
