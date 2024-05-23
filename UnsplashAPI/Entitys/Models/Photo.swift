//
//  Photo.swift
//  UnsplashAPI
//
//  Created by brubru on 11.05.2024.
//

import Foundation

struct Photo: Identifiable, Equatable, Codable {
	let id: String
	let createdAt: String
	let description: String
	let urls: URLKind
	let user: Author
	let location: Location
	let downloads: Int?
	var isFavorite: Bool
	
	static func getPhoto() -> Photo {
		Photo(
			id: "1",
			createdAt: "03.03.2010",
			description: "Rick",
			urls: URLKind(
				regular: "",
				small: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
				thumb: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
			),
			user: Author(id: "0", name: "Piter"),
			location: Location(name: "Parise"),
			downloads: 10,
			isFavorite: true
		)
	}
	
	static func getEmptyPhoto() -> Photo {
		Photo(
			id: "",
			createdAt: "",
			description: "",
			urls: URLKind(
				regular: "",
				small: "",
				thumb: ""
			),
			user: Author(id: "", name: ""),
			location: Location(name: ""),
			downloads: nil,
			isFavorite: false
		)
	}
}

struct URLKind: Equatable, Codable {
	let regular: String
	let small: String
	let thumb: String
}

struct Location: Equatable, Codable {
	let name: String
}

struct Author: Equatable, Codable {
	let id: String
	let name: String
}
