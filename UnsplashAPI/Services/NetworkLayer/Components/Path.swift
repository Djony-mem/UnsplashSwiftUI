//
//  Path.swift
//  UnsplashAPI
//
//  Created by brubru on 18.05.2024.
//

import Foundation

enum Path {
	case searchPath
	case randomPhoto
	case photoByID(_ id: String)
	
	var path: String {
		switch self {
		case .searchPath:
			return "search/photos/"
		case .randomPhoto:
			return "photos/random/"
		case .photoByID(let id):
			return "photos/\(id)"
		}
	}
}
