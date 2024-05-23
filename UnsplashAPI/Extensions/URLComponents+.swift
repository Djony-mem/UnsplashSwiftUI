//
//  URLComponents+.swift
//  UnsplashAPI
//
//  Created by brubru on 18.05.2024.
//

import Foundation

extension URLComponents {
	public func setParameters(_ parameters: [String: Any]) -> URLComponents {
		var urlComponents = self
		urlComponents.queryItems = parameters.map {
			URLQueryItem(name: $0, value: String(describing: $1))
		}
		return urlComponents
	}
}
