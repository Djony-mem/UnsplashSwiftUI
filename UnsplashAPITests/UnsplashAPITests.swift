//
//  UnsplashAPITests.swift
//  UnsplashAPITests
//
//  Created by Шаповалов Илья on 13.05.2024.
//

import XCTest
@testable import UnsplashAPI

//final class UnsplashAPITests: XCTestCase {
//    private var sut: DetailViewModel!
//    let exp = XCTestExpectation()
//    private let mockModel = Photo(
//        id: "test",
//        createdAt: "foo",
//        description: "pup",
//        urls: URLKind(regular: "", small: "", thumb: "baz"),
//        user: Author(id: "", name: "bar"),
//        location: Location(name: "baz"),
//        downloads: 1,
//        isFavorite: true
//    )
//   
//    override func setUp() async throws {
//        try await super.setUp()
//		
//		let repositoryStub = PhotoRepositoryStub()
//        
//		#warning("Пока тема тестинга для меня сложновата, не знаю как работать с ассинхронными сущностями.")
//		#warning("Первое что приходит в голову это создать протокол, и на него подписать фейковую вью модель")
//		sut = await DetailViewModel(
//			id: "1",
//            repositoryStub
//        )
//    }
//    
//    override func tearDown() async throws {
//        try await super.tearDown()
//        
//        sut = nil
//    }
//    
//    func test_initialState() {
//        XCTAssertEqual(sut.name, "pup")
//        XCTAssertTrue(sut.isFavorite)
//        XCTAssertEqual(sut.photoLink, URL(string: "baz"))
//        XCTAssertEqual(sut.author, "bar")
//        XCTAssertEqual(sut.createdAt, "foo")
//        XCTAssertEqual(sut.location, "baz")
//        XCTAssertEqual(sut.downloads, "1")
//    }
//    
//    func test_onViewAppear() {
//        sut = DetailViewModel(
//            mockModel,
//            getPhotoWithId: { id in
//                XCTAssertEqual(id, self.mockModel.id)
//                self.exp.fulfill()
//                return .failure(.noData)
//            }
//        )
//        
//        sut.onViewAppear()
//        wait(for: [exp], timeout: 0.1)
//    }
//    
//   
//}

private let dtoStub = PhotoDTO(
    id: "",
    createdAt: "",
    altDescription: nil,
    urls: URLKindDTO(regular: "", small: "", thumb: ""),
    user: AuthorDTO(id: "", name: ""),
    location: LocationDTO(name: ""),
    downloads: 10
)
