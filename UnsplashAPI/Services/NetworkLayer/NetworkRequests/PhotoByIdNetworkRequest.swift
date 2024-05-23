//
//  PhotoByIdNetworkRequest.swift
//  UnsplashAPI
//
//  Created by brubru on 19.05.2024.
//

import Foundation

struct PhotoByIdNetworkRequest: NetworkRequest {
	struct Parameter: Codable, Equatable {
		let client_id: String
	}
	
	struct PhotoID {
		let id: String
	}
	
	var parameter: Parameter
	var id: PhotoID
	
	var path: Path {
		.photoByID(id.id)
	}
	
	var method: HTTPMethod {
		.get
	}
	
	var parameters: Parameters {
		guard let dictionary = parameter.dictionary else { return .none}
		return .url(dictionary)
	}
}
