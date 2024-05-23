//
//  PhotoManager.swift
//  UnsplashAPI
//
//  Created by brubru on 11.05.2024.
//

import Foundation

protocol IPhotoManager {
	func fetchRandomPhotos() async -> [Photo]
	func fetchSearchPhotos(_ text: String) async -> [Photo]
	func fetchPhotoWithId(_ id: String) async -> Photo?
}

final class PhotoManager: IPhotoManager {
	
	private let accessKey = "CFhBnQf9fx8sNPMiUAbt1qNR80Eq3KZDcOc_Ts8SP48"
	private let networkService: INetworkService
	
	init(networkService: INetworkService) {
		self.networkService = networkService
	}
	
	func fetchRandomPhotos() async -> [Photo] {
		let networkRequest = RandomNetworkRequest(
			parameter: RandomNetworkRequest.Parameter(count: "30", client_id: accessKey)
		)
		
//		#warning("Нужно ли вынести в отдельный метод этот повторяющийся код или это уже over инжиниринг")
		switch await networkService.perform(type: [PhotoDTO].self, request: networkRequest) {
		case .success(let photos):
			return photos.map(map)
		case .failure(let error):
			print(error.localizedDescription)
			return []
		}
	}
	
	func fetchSearchPhotos(_ text: String) async -> [Photo] {
		let networkRequest = SearchNetworkRequest(
			parameter: SearchNetworkRequest.Parameter(query: text, client_id: accessKey)
		)
		
		switch await networkService.perform(type: SearchPhoto.self, request: networkRequest) {
		case .success(let searchPhoto):
			return searchPhoto.results.map(map)
		case .failure(let error):
			print(error.localizedDescription)
			return []
		}
	}
	
	func fetchPhotoWithId(_ id: String) async -> Photo? {
		let networkRequest = PhotoByIdNetworkRequest(
			parameter: PhotoByIdNetworkRequest.Parameter(client_id: accessKey),
			id: PhotoByIdNetworkRequest.PhotoID(id: id))
		
		switch await networkService.perform(type: PhotoDTO.self, request: networkRequest) {
		case .success(let photo):
			return map(photo: photo)
		case .failure(let error):
			print(error.localizedDescription)
			return nil
		}
	}
}

private extension PhotoManager {
	
	func map(photo: PhotoDTO) -> Photo {
		Photo(
			id: photo.id,
			createdAt: photo.createdAt,
			description: photo.altDescription ?? "",
			urls: URLKind(
				regular: photo.urls.regular,
				small: photo.urls.small,
				thumb: photo.urls.thumb
			),
			user: Author(id: photo.user.id, name: photo.user.name),
			location: Location(name: photo.location?.name ?? "undefined"),
			downloads: photo.downloads,
			isFavorite: false
		)
	}
}
