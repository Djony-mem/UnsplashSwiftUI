//
//  PhotoViewModel.swift
//  UnsplashAPI
//
//  Created by brubru on 05.05.2024.
//

import Foundation
import Combine

@MainActor
final class RandomPhotoViewModel: ObservableObject {
	@Published private(set) var photoViewModelList: [Photo] = []
	@Published private(set) var filterPhotoViewModels: [Photo] = []
	@Published var searchPhoto = ""

	private let photoManager: IPhotoManager
	
	private var cancellables = Set<AnyCancellable>()
	
	var isSearching: Bool {
		!searchPhoto.isEmpty
	}
	
	var photos: [Photo] {
		isSearching ? filterPhotoViewModels : photoViewModelList
	}
	
	init(_ photoManager: IPhotoManager) {
		self.photoManager = photoManager
		addPhotos()
	}
	
	func onAppear() {
		fetchPhotoList()
	}
	
	func addPhotos() {
		$searchPhoto
			.debounce(for: 0.3, scheduler: DispatchQueue.main)
			.sink { [weak self] _ in
				self?.filterPhotos()
			}
			.store(in: &cancellables)
	}
	
	func fetchPhotoList() {
		Task {
			photoViewModelList = await photoManager.fetchRandomPhotos()
		}
	}
	
	private func filterPhotos() {
		Task {
			filterPhotoViewModels = await photoManager.fetchSearchPhotos(searchPhoto)
		}
	}
	
}
