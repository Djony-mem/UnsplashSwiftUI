//
//  FavoritePhotoList.swift
//  UnsplashAPI
//
//  Created by brubru on 03.05.2024.
//

import SwiftUI

struct FavoritePhotoView<Destination: View>: View {
	let photoViewModel: [Photo]
	let title: String
    let destination: (Bool, String) -> Destination
	let tapOnCell: (Photo) -> ()
	
	var body: some View {
		NavigationStack {
			List(photoViewModel) { photo in
				NavigationLink(
					destination: destination(false, photo.id)
				) {
					FavoriteCellView(photoViewModel: photo)
				}
				.swipeActions {
					Button(action: { tapOnCell(photo) }) {
						Image(systemName: "trash")
					}
					.tint(.red)
				}
			}
			.navigationTitle(title)
		}
    }
}

#Preview {
	FavoritePhotoView(
		photoViewModel: [],
		title: "Favorite Photo",
		destination: { _,_  in EmptyView() }, tapOnCell: {_ in }
	)
}

