//
//  FavoritePhototViewModel.swift
//  UnsplashAPI
//
//  Created by brubru on 09.05.2024.
//

import Foundation

final class FavoritePhotoViewModel: ObservableObject {
	@Published private(set) var favoritePhotoViewModes: [Photo] = []
	private let storeManager: IStoreManager
	
	init(_ storeManager: IStoreManager) {
		self.storeManager = storeManager
	}
	
	func onAppear() {
		fetchPhotoList()
	}
	
	func tapOnCell(_ photo: Photo) {
        guard let deleted = storeManager.remove(photo: photo) else { return }
        favoritePhotoViewModes.removeAll { $0 == deleted }
//		fetchPhotoList()
//		#warning("Не очень круто обновлять всю таблицу целиком, но я ничего лучше не придумала")
	}
	
	private func fetchPhotoList() {
		favoritePhotoViewModes = storeManager.fetchPhotos()
	}
}
