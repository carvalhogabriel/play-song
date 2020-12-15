//
//  Play_SongApp.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 01/12/20.
//

import SwiftUI
import Firebase

@main
struct Play_SongApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    init() {
        FirebaseApp.configure()
    }
}
