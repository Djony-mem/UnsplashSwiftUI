//
//  FavoriteButton.swift
//  UnsplashAPI
//
//  Created by brubru on 19.05.2024.
//

import SwiftUI

struct FavoriteButton: ToolbarContent {
	let isFavorite: Bool
	let action: () -> Void
	
	var body: some ToolbarContent {
		ToolbarItem(placement: .topBarTrailing) {
			Image(systemName: isFavorite ? "heart.fill" : "heart")
				.onTapGesture(perform: action)
		}
	}
}
