//
//  GalleryViewModelTests.swift
//  MyFlickrGalleryTests
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import Foundation
import XCTest
@testable import MyFlickrGallery

class GalleryViewModelTests: XCTestCase {
    
    var viewModel: GalleryViewModel!
    
    override func setUp() {
        super.setUp()
        let provider = PublicFeedProvider(service: ServiceStub(serviceConfig: ServiceConfig()))
        viewModel = GalleryViewModel(provider: provider)
    }
    
    func testRefreshContent() {
    }
}
