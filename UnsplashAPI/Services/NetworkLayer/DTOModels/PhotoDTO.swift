//
//  Photo.swift
//  UnsplashAPI
//
//  Created by brubru on 04.05.2024.
//

import SwiftUI

struct PhotoDTO: Codable, Identifiable {
	let id: String
	let createdAt: String
	let altDescription: String?
	let urls: URLKindDTO
	let user: AuthorDTO
	let location: LocationDTO?
	let downloads: Int?
}

struct URLKindDTO: Codable {
	let regular: String
	let small: String
	let thumb: String
}

struct LocationDTO: Codable {
	let name: String?
}

struct AuthorDTO: Codable {
	let id: String
	let name: String
}
