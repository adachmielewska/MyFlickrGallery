//
//  Operation.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 23.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

protocol Operation {
    
    associatedtype Output
    
    var request: Request { get }
    func execute(in service: Service, onComplete: @escaping (Output) -> Void, onError: @escaping (Int?, Error?) -> Void)
}
