//
//  PhotoDetaleView.swift
//  UnsplashAPI
//
//  Created by brubru on 05.05.2024.
//

import SwiftUI

struct DetailView: View {
    let photoLink: URL?
    let userName: String
    let createAt: String
    let location: String
    let downloads: String
    let title: String
    let isFavorite: Bool
	let isActive: Bool
    let favoriteTap: () -> Void
	
    var body: some View {
        List {
            AsyncImage(url: photoLink) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text("Author: ".appending(userName))
            Text("Data of creation: ".appending(createAt))
            Text("Location: ".appending(location))
            Text("Downloads count: ".appending(downloads))
        }
        .navigationTitle(title)
        .toolbar {
			if isActive {
				FavoriteButton(isFavorite: isFavorite, action: favoriteTap)
			}
        }
    }
}

#Preview {
    NavigationView {
        DetailView(
            photoLink: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
            userName: "Name",
            createAt: "01.01.01",
            location: "Paris",
            downloads: "100",
            title: "Title",
			isFavorite: false, 
			isActive: true,
            favoriteTap: { }
        )
    }
}
