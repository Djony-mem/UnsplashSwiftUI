//
//  StoreManager.swift
//  UnsplashAPI
//
//  Created by brubru on 18.05.2024.
//

import SwiftUI

protocol IStoreManager {
	func save(photo: Photo)
	func remove(photo: Photo) -> Photo?
	func fetchPhotos() -> [Photo]
	func isFavorite(id: String) -> Bool
}

final class StoreFavoritePhotoManager: IStoreManager {
	
	@AppStorage("photos") private var photosData: Data?
	private var decoder = JSONDecoder()
	private var encoder = JSONEncoder()
	
	init() {
		photosData = try? encoder.encode([Photo]())
	}
	
	func save(photo: Photo) {
		guard let photosData else { return }
		var photos = try? decoder.decode([Photo].self, from: photosData)
		
		photos?.append(photo)
		
		guard let photos else { return }
		self.photosData = try? encoder.encode(photos)
		print(photo.id, "save")
	}
	
	func remove(photo: Photo) -> Photo? {
		guard let photosData else { return nil }
		var photos = try? decoder.decode([Photo].self, from: photosData)
		
		photos?.removeAll { $0 == photo }
		
		guard let photos else { return nil }
		self.photosData = try? encoder.encode(photos)
        return photo
	}
	
	func fetchPhotos() -> [Photo] {
		guard let photosData else { return [] }
		let photos = try? decoder.decode([Photo].self, from: photosData)
		guard let photos else { return [] }
		print("array", photos)
		return photos
	}
	
	func isFavorite(id: String) -> Bool {
		guard let photosData else { return false }
        let photos = try? decoder.decode([Photo].self, from: photosData)
		
		let photosID = photos?.map { $0.id }
		
		guard let photosID else { return false }
		
		return photosID.contains(id)
	}
}
