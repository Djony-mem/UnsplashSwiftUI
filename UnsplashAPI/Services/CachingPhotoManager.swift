//
//  PhotoRepositoryStub.swift
//  UnsplashAPI
//
//  Created by brubru on 05.05.2024.
//

import Foundation


final class CachingPhotoManager: IPhotoManager {
	
	
	private let photoManager: IPhotoManager
	
	init(photoManager: IPhotoManager) {
		self.photoManager = photoManager
	}
	
	func fetchRandomPhotos() async -> [Photo] {
		await photoManager.fetchRandomPhotos()
	}
	
	func fetchSearchPhotos(_ text: String) async -> [Photo] {
		await photoManager.fetchSearchPhotos(text)
	}
	
	func fetchPhotoWithId(_ id: String) async -> Photo? {
		await photoManager.fetchPhotoWithId(id)
	}
}
