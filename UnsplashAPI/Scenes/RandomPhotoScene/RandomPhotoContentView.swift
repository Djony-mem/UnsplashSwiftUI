//
//  RandomPhotoContentView.swift
//  UnsplashAPI
//
//  Created by brubru on 12.05.2024.
//

import SwiftUI

struct RandomPhotoContentView: View {
	@StateObject private var viewModel: RandomPhotoViewModel
    @EnvironmentObject private var assembly: Assembly
	
	init(_ photoManager: IPhotoManager) {
		self._viewModel = StateObject(wrappedValue: RandomPhotoViewModel(photoManager))
	}
	
	var body: some View {
		RandomPhotoView(
			photos: viewModel.photos,
			query: $viewModel.searchPhoto,
			isLoading: .constant(false),
			action: viewModel.onAppear,
			detail: { photo in
				NavigationLink(destination: assembly.makeDetailModule(isActive: true, id: photo.id)) {
					PhotoCellView(photoViewModel: photo)
				}
			}
		)
		.equatable()
	}
}
