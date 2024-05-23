//
//  EndpointTests.swift
//  UnsplashAPITests
//
//  Created by Илья Шаповалов on 20.05.2024.
//

import XCTest
@testable import UnsplashAPI

final class EndpointTests: XCTestCase {
    
    func test_endpoint() {
        let sut = Endpoint
            .new
            .setScheme(.https)
            .setHost("baz.bar.foo")
            .setPath("baz")
            .addQueryItems {
                URLQueryItem(name: "item1", value: "1")
                URLQueryItem(name: "item2", value: "2")
            }
        
        XCTAssertEqual(sut.scheme, "https")
        XCTAssertEqual(sut.host, "baz.bar.foo")
        XCTAssertEqual(sut.path, "/baz")
        XCTAssertEqual(
            sut.queryItems,
            [
                URLQueryItem(name: "item1", value: "1"), 
                URLQueryItem(name: "item2", value: "2")
            ]
        )
        XCTAssertEqual(
            sut.url,
            URL(string: "https://baz.bar.foo/baz?item1=1&item2=2")
        )
    }
    
    func test_randomPhotosURL() {
        let sut = Endpoint.randomPhotos(limit: 30)
        
        XCTAssertEqual(
            sut.url,
            URL(string: "https://api.unsplash.com/photos/random/?count=30")
        )
    }
    
    func test_searchURL() {
        let sut = Endpoint.search(query: "baz")
        
        XCTAssertEqual(
            sut.url,
            URL(string: "https://api.unsplash.com/search/photos/?query=baz")
        )
    }
    
    func test_searchPhotoWithId() {
        let sut = Endpoint.photo(withId: 1)
        
        XCTAssertEqual(
            sut.url,
            URL(string: "https://api.unsplash.com/photos/1")
        )
    }
}
