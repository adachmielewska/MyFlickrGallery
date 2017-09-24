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

    let provider: PublicFeedProvider
    weak var delegate: GalleryViewModelDelegate?
    var feed: [GalleryCellViewModel] = [] {
        didSet {
            delegate?.updated()
        }
    }
    
    init(provider: PublicFeedProvider) {
        self.provider = provider
        refreshContent()
    }
    
    func refreshContent() {
        provider.getPublicFeed(onComplete: { [weak self] posts in
            posts.isEmpty ? self?.refreshContent() : self?.feed.insert(contentsOf: posts.map { GalleryCellViewModel(post: $0) }, at: 0)
        })
    }
}
