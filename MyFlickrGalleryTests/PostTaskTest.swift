//
//  PostTaskTest.swift
//  MyFlickrGalleryTests
//
//  Created by Ada Chmielewska on 23.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import MyFlickrGallery

class PostTaskTest: XCTestCase {
    
    var testService: ServiceStub!
    var postTask: PostTask!
    
    override func setUp() {
        super.setUp()
        testService = ServiceStub(serviceConfig: ServiceConfig())
        postTask = PostTask()
        let bundle = Bundle(for: type(of: self))
        let json = bundle
            .url(forResource: "Flickr_posts", withExtension: "json")
            .flatMap { try? Data(contentsOf: $0) }
            .flatMap { try? JSONSerialization.jsonObject(with: $0) } ?? NSNull()
        testService.jsonResponse = json
    }
    
    func testPostParse() {
        let expectedData = [
            Post(title: "DSC_4436.jpg", author: "va1berg", tags: [], imageURL: "https://farm5.staticflickr.com/4435/36551313354_a607e8ff63_m.jpg", createdDate: ISO8601DateFormatter().date(from: "2017-07-10T08:04:51-08:00")!, publishedDate: ISO8601DateFormatter().date(from: "2017-09-23T11:01:59Z")!),
             Post(title: "Autumn", author: "emmagrant969", tags: ["flickr", "insta"], imageURL: "https://farm5.staticflickr.com/4482/36591655943_d7c39a0f09_m.jpg", createdDate: ISO8601DateFormatter().date(from: "2017-09-23T03:55:00-08:00")!, publishedDate: ISO8601DateFormatter().date(from: "2017-09-23T11:02:03Z")!),
        ]
        var returnedData: [Post] = []
        postTask.execute(in: testService, onComplete: { posts in
            returnedData = posts
        }, onError: {_,_ in })
        
        XCTAssertEqual(returnedData, expectedData)
    }
}
