//
//  RandomPhotoList.swift
//  UnsplashAPI
//
//  Created by brubru on 03.05.2024.
//

import SwiftUI


struct RandomPhotoView<Content: View>: View {
	private let navigationTitle = "Photo List"
	private let placeholderInSearch = "Search photo"
	private let buttonTitle = "Fetch"
	
	private let columns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
    
    let photos: [Photo]
    @Binding var query: String
    @Binding var isLoading: Bool
	var action: () -> ()
    
    let detail: (Photo) -> Content
    
    var body: some View {
		NavigationStack {
			ScrollView {
                if isLoading {
                    ProgressView()
                } else {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(photos, content: detail)
                    }
                    .padding()
                }
			}
			.navigationTitle(navigationTitle)
			.searchable(text: $query, prompt: placeholderInSearch)
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button(buttonTitle) {
						action()
					}
				}
			}
		}
	}
}

extension RandomPhotoView: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        guard
            lhs.photos == rhs.photos,
            lhs.query == rhs.query,
            lhs.isLoading == rhs.isLoading
        else {
            return false
        }
        return true
    }
}

#Preview {
    RandomPhotoView(
        photos: [],
        query: .constant("querty"), 
		isLoading: .constant(true),
		action: {},
        detail: { _ in EmptyView() }
    )
}

#Preview {
    RandomPhotoView(
        photos: [],
        query: .constant("querty"),
		isLoading: .constant(false), 
		action: {},
        detail: { _ in EmptyView() }
    )
}
