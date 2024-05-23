//
//  DetailViewModel.swift
//  UnsplashAPI
//
//  Created by Шаповалов Илья on 13.05.2024.
//

import Foundation

#warning("Использую акторы, но плохо понимаю как они работают")
@MainActor
final class DetailViewModel: ObservableObject {
    //MARK: - Private properties
	@Published private var photo: Photo = Photo.getEmptyPhoto()
    
    //MARK: - Public properties
    var name: String { photo.description }
	var isFavorite: Bool { photo.isFavorite }
    var photoLink: URL? { URL(string: photo.urls.thumb) }
    var author: String { photo.user.name }
    var createdAt: String { photo.createdAt }
    var location: String { photo.location.name }
	var downloads: String { photo.downloads?.description ?? "nil" }
    
	private let photoManager: IPhotoManager
	private let storeManager: IStoreManager
	private let id: String
    
    //MARK: - init(_:)
	
	#warning("Раньше здесь в параметре я принимала сразу экземпляр картинки, а теперь я ее загружаю с нуля")
    init(
		id: String,
		photoManager: IPhotoManager,
		storeManager: IStoreManager
    ) {
        self.id = id
		self.photoManager = photoManager
		self.storeManager = storeManager
    }
    
    //MARK: - Public methods
    func onViewAppear() {
        Task() { [weak self] in
            guard let self else { return }
			photo = await photoManager.fetchPhotoWithId(id) ?? Photo.getEmptyPhoto()
			photo.isFavorite = storeManager.isFavorite(id: id)
        }
    }
	
	func tapOnFavoriteButton() {
		photo.isFavorite.toggle()
		
		if photo.isFavorite {
			storeManager.save(photo: photo)
		} else {
			storeManager.remove(photo: photo)
		}
	}
}



	// Можно разложить результат следующим образом:
	//            await getPhotoWithId(photo.id)
	//                .publisher
	//                .map(map(photo:))
	//                .receive(on: DispatchQueue.main)
	//                .sink { completion in
	//                    switch completion {
	//                    case let .failure(error):
	//                        print(error)
	//
	//                    case .finished:
	//                        break
	//                    }
	//                } receiveValue: { photo in
	//                    self.photo = photo
	//                }
