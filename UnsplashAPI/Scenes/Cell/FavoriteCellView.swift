//
//  FavoriteCellView.swift
//  UnsplashAPI
//
//  Created by brubru on 09.05.2024.
//

import SwiftUI

struct FavoriteCellView: View {
	var photoViewModel: Photo
	
	var body: some View {
		HStack {
			AsyncImage(url: URL(string: photoViewModel.urls.small)) { image in
				image
					.resizable()
					.frame(width: 50, height: 50)
					.aspectRatio(contentMode: .fit)
					.clipShape(RoundedRectangle(cornerRadius: 15))
			} placeholder: {
				ProgressView()
			}
			Text(photoViewModel.user.name)
		}
		
	}
}

#warning("Где лучше создать фейковые PhotoViewModel? Что бы можно было использовать в превью")

