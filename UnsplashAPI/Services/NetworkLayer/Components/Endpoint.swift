//
//  File.swift
//  UnsplashAPI
//
//  Created by Илья Шаповалов on 20.05.2024.
//

import Foundation

/*
 var path: String {
     switch self {
     case .searchPath:
         return "search/photos/"
     case .randomPhoto:
         return "photos/random/"
     case .photoByID(let id):
         return "photos/\(id)"
     }
 }
 */

// "https://api.unsplash.com"

@dynamicMemberLookup
struct Monad<T> {
    let value: T
    
    init(_ value: T) { self.value = value }
    
    subscript<U>(dynamicMember keyPath: KeyPath<T, U>) -> U {
        value[keyPath: keyPath]
    }
    
    func map<U>(_ transform: (T) throws -> U) rethrows -> Monad<U> {
        try Monad<U>(transform(value))
    }
}

typealias Endpoint = Monad<URLComponents>

extension Endpoint {
    //MARK: - HTTPScheme
    enum HTTPScheme: String {
        case http
        case https
    }
    
    //MARK: - QueryBuilder
    @resultBuilder
    enum QueryBuilder {
        @inlinable
        static func buildBlock(_ components: URLQueryItem...) -> [URLQueryItem] {
            components
        }
    }
    
    static let new = Endpoint(.init())
    static let unsplash = Endpoint.new
        .setScheme(.https)
        .setHost("api.unsplash.com")
    
    static let unsplashPhoto = unsplash.setPath("photos")
    
    private func inoutMap(_ transform: (inout URLComponents) -> Void) -> Self {
        map { old in
            var new = old
            transform(&new)
            return new
        }
    }
    
    func setScheme(_ s: HTTPScheme) -> Self {
        inoutMap { components in
            components.scheme = s.rawValue
        }
    }
    
    func setHost(_ h: String) -> Self {
        inoutMap { components in
            components.host = h
        }
    }
    
    func setPath(_ p: String) -> Self {
        inoutMap { components in
            components.path = "/".appending(p)
        }
    }
    
    func addPath(_ p: String) -> Self {
        inoutMap { components in
            components.path = components.path
                .appending("/")
                .appending(p)
        }
    }
    
    func addQueryItems(@QueryBuilder _ body: () -> [URLQueryItem]) -> Self {
        inoutMap { components in
            components.queryItems = body()
        }
    }
    
    static func search(query: String) -> Endpoint {
        Endpoint
            .unsplash
            .setPath("search/photos/")
            .addQueryItems {
                URLQueryItem(name: "query", value: query)
            }
    }
    
    static func randomPhotos(limit: Int) -> Endpoint {
        Endpoint
            .unsplashPhoto
            .addPath("random/")
            .addQueryItems {
                URLQueryItem(name: "count", value: limit.description)
            }
    }
    
    static func photo(withId id: Int) -> Endpoint {
        Endpoint
            .unsplashPhoto
            .addPath(id.description)
    }
    
}
