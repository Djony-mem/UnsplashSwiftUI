//
//  DetailContentView.swift
//  UnsplashAPI
//
//  Created by brubru on 19.05.2024.
//

import SwiftUI

struct DetailContentView: View {
	@StateObject var viewModel: DetailViewModel
	let isActive: Bool
	
	init(
		isActive: Bool,
		id: String,
		phoneManager: IPhotoManager,
		storageManager: IStoreManager
	) {
		self.isActive = isActive
		self._viewModel = StateObject(
			wrappedValue: DetailViewModel(
				id: id,
				photoManager: phoneManager,
				storeManager: storageManager
			)
		)
	}
	
	var body: some View {
		DetailView(
			photoLink: viewModel.photoLink,
			userName: viewModel.author,
			createAt: viewModel.createdAt,
			location: viewModel.location,
			downloads: viewModel.downloads,
			title: viewModel.name,
			isFavorite: viewModel.isFavorite, 
			isActive: isActive,
			favoriteTap: { viewModel.tapOnFavoriteButton() }
		)
		.onAppear(perform: viewModel.onViewAppear)
	}
}
