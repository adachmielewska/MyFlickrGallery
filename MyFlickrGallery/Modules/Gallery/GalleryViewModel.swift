//
//  GalleryViewModel.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation

protocol GalleryViewModelDelegate: class {
    
    func updated()
}

class GalleryViewModel {

    weak var delegate: GalleryViewModelDelegate?
    var feed: [GalleryCellViewModel] = [] {
        didSet {
            delegate?.updated()
        }
    }
    
    init(provider: PublicFeedProvider) {

        provider.getPublicFeed(onComplete: { posts in
            self.feed = posts.map { GalleryCellViewModel(post: $0) }
        })
    }
}
