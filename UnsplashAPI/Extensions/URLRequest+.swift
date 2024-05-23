//
//  URLRequest+.swift
//  UnsplashAPI
//
//  Created by brubru on 18.05.2024.
//

import Foundation


extension URLRequest {

	mutating func add(parameters: Parameters) {
		switch parameters {
		case .none:
			break
		case .url(let dictionary):
			guard let url = url, var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { break }
			components = components.setParameters(dictionary)
			guard let newUrl = components.url else { break }
			self.url = newUrl
		}
	}
}
