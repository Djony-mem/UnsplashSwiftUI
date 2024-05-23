//
//  Result+.swift
//  UnsplashAPI
//
//  Created by brubru on 18.05.2024.
//

import Foundation

extension Result where Failure == Error {
	init(_ asyncCatch: () async throws -> Success) async {
		do {
			let success = try await asyncCatch()
			self = .success(success)
		} catch {
			self = .failure(error)
		}
	}
}
