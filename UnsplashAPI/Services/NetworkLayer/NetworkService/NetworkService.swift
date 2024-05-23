//
//  NetworkService.swift
//  UnsplashAPI
//
//  Created by brubru on 05.05.2024.
//

import Foundation

enum NetworkError: Error {
	case invalidURL
	case invalidURLComponents
	case invalidEndpointURL
	case noData
	case decodingError
    
    init(_ error: Error) {
        switch error {
        case is URLError:
            self = .invalidURL
            
        case is DecodingError:
            self = .decodingError
            
        default:
            assertionFailure()
            self = .noData
        }
    }
}


protocol INetworkService {
	func perform<T: Codable>(type: T.Type, request: NetworkRequest) async -> Result<T, NetworkError>
}

final class NetworkServiceImpl: INetworkService {
	private let decoder = JSONDecoder()
	
	private let session: URLSession
	private let requestBuilder: IURLRequestBuilder
	
	init(session: URLSession, requestBuilder: IURLRequestBuilder) {
		self.session = session
		self.requestBuilder = requestBuilder
		decoder.keyDecodingStrategy = .convertFromSnakeCase
	}

	func perform<T: Codable>(type: T.Type, request: NetworkRequest) async -> Result<T, NetworkError> {

		let urlRequest = requestBuilder.build(forRequest: request)
		
		return await Result {
			try await URLSession.shared.data(for: urlRequest)
        }
        .map(\.0)
		.flatMap { data in Result { try decoder.decode(T.self, from: data) } }
		.mapError(NetworkError.init)
	}
}
