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

private enum Order {
    case ascending
    case descending
    
    func title() -> String {
        switch self {
        case .ascending:
            return "Ascending order"
        case .descending:
            return "Descending order"
        }
    }
}

class GalleryViewModel {

    let provider: PublicFeedProvider
    weak var delegate: GalleryViewModelDelegate?
    var feed: [GalleryCellViewModel] = [] {
        didSet {
            delegate?.updated()
        }
    }
    private var order: Order = .ascending
    
    init(provider: PublicFeedProvider) {
        self.provider = provider
        refreshContent()
    }
    
    func refreshContent() {
        provider.getPublicFeed(onComplete: { [weak self] posts in
            posts.isEmpty ? self?.refreshContent() : self?.feed.insert(contentsOf: posts.map { GalleryCellViewModel(post: $0) }, at: 0)
            self?.orderFeed()
        })
    }
    
    func orderFeed() {
        switch order {
        case .ascending: feed.sort { $0.takenDate > $1.takenDate }
                        order = .descending
        case .descending: feed.sort { $0.takenDate < $1.takenDate }
                        order = .ascending
        }
    }
    
    func orderTitle() -> String {
        return order.title()
    }
}
