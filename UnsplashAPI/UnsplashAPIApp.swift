//
//  UnsplashAPIApp.swift
//  UnsplashAPI
//
//  Created by brubru on 03.05.2024.
//

import SwiftUI

@main
struct UnsplashAPIApp: App {
	// Один Assembly на весь проект? Или здесь может быть несколько Assembly под каждую сцену?
    let assembly = Assembly()
    
    var body: some Scene {
        WindowGroup {
			StarterView()
                .environmentObject(assembly)
        }
    }
}
