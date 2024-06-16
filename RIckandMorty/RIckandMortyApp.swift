//
//  RIckandMortyApp.swift
//  RIckandMorty
//
//  Created by Maor Niv on 6/7/24.
//

import SwiftUI
import Firebase

@main
struct RIckandMortyApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

