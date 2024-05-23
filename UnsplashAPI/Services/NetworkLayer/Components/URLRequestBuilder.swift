//
//  URLRequestBuilder.swift
//  UnsplashAPI
//
//  Created by brubru on 18.05.2024.
//

import Foundation

protocol IURLRequestBuilder {
	func build(forRequest request: NetworkRequest) -> URLRequest
}

struct URLRequestBuilder: IURLRequestBuilder {
	var baseUrl: URL
	
	func build(forRequest request: NetworkRequest) -> URLRequest {
		let url = baseUrl.appendingPathComponent(request.path.path)
		
		var urlRequest = URLRequest(url: url)
		
		urlRequest.httpMethod = request.method.rawValue
		urlRequest.add(parameters: request.parameters)
		
		return urlRequest
	}
}
