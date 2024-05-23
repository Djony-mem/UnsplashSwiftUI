//
//  PhotoCellView.swift
//  UnsplashAPI
//
//  Created by brubru on 05.05.2024.
//

import SwiftUI

struct PhotoCellView: View {
	var photoViewModel: Photo
	
	var body: some View {
        AsyncImage(url: URL(string: photoViewModel.urls.thumb)){ image in
			image
				.resizable()
				.aspectRatio(contentMode: .fit)
				.clipShape(RoundedRectangle(cornerRadius: 15))
		} placeholder: {
			ProgressView()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
}

