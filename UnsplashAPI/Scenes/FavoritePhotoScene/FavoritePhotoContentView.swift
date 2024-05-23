//
//  FavoritePhotoContentView.swift
//  UnsplashAPI
//
//  Created by brubru on 12.05.2024.
//

import SwiftUI

struct FavoritePhotoContentView: View {
	enum Constant {
		static let navigationTitle = "Favourite Photo"
	}
    @EnvironmentObject private var assembly: Assembly
	@StateObject private var viewModel: FavoritePhotoViewModel
	
	init(_ storeManager: IStoreManager) {
		self._viewModel = StateObject(wrappedValue: FavoritePhotoViewModel(storeManager))
	}
	
	var body: some View {
        FavoritePhotoView(
            photoViewModel: viewModel.favoritePhotoViewModes,
            title: Constant.navigationTitle, 
			destination: assembly.makeDetailModule,
			tapOnCell: viewModel.tapOnCell
        )
		.onAppear {
			viewModel.onAppear()
		}
		#warning("Хотела оставить кнопку избранные на детальном экране, но не придумала как обновить это представление")
	}
}
