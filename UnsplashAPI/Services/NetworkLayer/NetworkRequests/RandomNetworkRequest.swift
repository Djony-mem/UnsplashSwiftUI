//
//  RundomNetworkRequest.swift
//  UnsplashAPI
//
//  Created by brubru on 18.05.2024.
//

import Foundation

struct RandomNetworkRequest: NetworkRequest {
	struct Parameter: Codable, Equatable  {
		let count: String
		let client_id: String
	}
	
	var parameter: Parameter
	
	var path: Path {
		.randomPhoto
	}
	
	var method: HTTPMethod {
		.get
	}
	
	var parameters: Parameters {
		guard let dictionary = parameter.dictionary else { return .none}
		return .url(dictionary)
	}
	
	
}
