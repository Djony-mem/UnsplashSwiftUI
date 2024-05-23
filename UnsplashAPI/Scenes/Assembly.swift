//
//  Assembly.swift
//  UnsplashAPI
//
//  Created by brubru on 11.05.2024.
//

import SwiftUI

// эта сущность похожа на координатор
final class Assembly: ObservableObject {
	private let baseURL = "https://api.unsplash.com"
    private let cachingPhotoManager: IPhotoManager
	private let storageManager: IStoreManager
	
	init() {
	#warning("Нормально здесь принудительное извлечение? - yes")
		let networkService: INetworkService = NetworkServiceImpl(
			session: URLSession(configuration: .default),
			requestBuilder: URLRequestBuilder(baseUrl: URL(string: baseURL)!)
		)
		let photoManager: IPhotoManager = PhotoManager(networkService: networkService)
		
		cachingPhotoManager = CachingPhotoManager(photoManager: photoManager)
		storageManager = StoreFavoritePhotoManager()
	}
	
	func makeRandomPhotoView() -> some View {
        RandomPhotoContentView(cachingPhotoManager)
	}
	
	func makeFavoritePhotoView() -> some View {
		FavoritePhotoContentView(storageManager)
	}
    
	func makeDetailModule(isActive: Bool, id: String) -> some View {
		DetailContentView(
			isActive: isActive,
			id: id, 
			phoneManager: cachingPhotoManager, 
			storageManager: storageManager
		)
    }
}
