//
//  Assemby+Controllers.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

extension Assemby {
    
    enum Controllers {
        
        static var galleryViewController: GalleryViewController {
            let galleryViewModel = GalleryViewModel(provider: Assemby.Dependencies.publicFeedProvider)
            return GalleryViewController(galleryViewModel: galleryViewModel)
        }
    }
}
