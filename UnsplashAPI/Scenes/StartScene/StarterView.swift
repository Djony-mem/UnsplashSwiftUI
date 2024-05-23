//
//  StarterView.swift
//  UnsplashAPI
//
//  Created by brubru on 03.05.2024.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var assembly: Assembly
	
    var body: some View {
		TabView {
			assembly.makeRandomPhotoView()
				.tabItem {
					Image(systemName: "house")
					Text("Home")
				}
			assembly.makeFavoritePhotoView()
				.tabItem {
					Image(systemName: "star")
					Text("Favorite")
				}
		}
    }
}

#Preview {
    StarterView()
        .environmentObject(Assembly())
}
