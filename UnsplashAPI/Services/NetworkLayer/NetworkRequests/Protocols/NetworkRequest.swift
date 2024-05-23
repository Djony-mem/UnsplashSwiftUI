//
//  NetworkRequest.swift
//  UnsplashAPI
//
//  Created by brubru on 18.05.2024.
//

import Foundation

protocol NetworkRequest {
	var path: Path { get }
	var method: HTTPMethod { get }
	var parameters: Parameters { get }
}
