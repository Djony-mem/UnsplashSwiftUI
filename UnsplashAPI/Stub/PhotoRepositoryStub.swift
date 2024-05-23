//
//  PhotoRepositoryStub.swift
//  UnsplashAPI
//
//  Created by brubru on 11.05.2024.
//

import Foundation

final class PhotoRepositoryStub: IPhotoManager {
	func fetchPhotoWithId(_ id: String) async -> Photo? {
		let photos = [
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
			),
			Photo(
				id: "2",
				createdAt: "03.03.2010",
				description: "Random Photo",
				urls: URLKind(
					regular: "",
					small: "https://rickandmortyapi.com/api/character/avatar/38.jpeg",
					thumb: "https://rickandmortyapi.com/api/character/avatar/38.jpeg"
				),
				user: Author(id: "0", name: "Piter"),
				location: Location(name: "Parise"),
				downloads: 10,
				isFavorite: false
			),
		]
		
		return photos.filter { $0.id == id }.first
	}
	
	
	func fetchRandomPhotos() async -> [Photo] {
		[
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
			),
			Photo(
				id: "2",
				createdAt: "03.03.2010",
				description: "Random Photo",
				urls: URLKind(
					regular: "",
					small: "https://rickandmortyapi.com/api/character/avatar/38.jpeg",
					thumb: "https://rickandmortyapi.com/api/character/avatar/38.jpeg"
				),
				user: Author(id: "0", name: "Piter"),
				location: Location(name: "Parise"),
				downloads: 10,
				isFavorite: false
			),
		]
	}
	

	func fetchSearchPhotos(_ text: String) async -> [Photo] {
		let photos = [
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
			),
			Photo(
				id: "2",
				createdAt: "03.03.2010",
				description: "Random Photo",
				urls: URLKind(
					regular: "",
					small: "https://rickandmortyapi.com/api/character/avatar/38.jpeg",
					thumb: "https://rickandmortyapi.com/api/character/avatar/38.jpeg"
				),
				user: Author(id: "0", name: "Piter"),
				location: Location(name: "Parise"),
				downloads: 10,
				isFavorite: false
			),
		]
		
		return photos.filter { $0.description.contains(text) }
	}
}
