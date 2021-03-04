//
//  Play_SongApp.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 01/12/20.
//

import SwiftUI
import Firebase
import FBSDKCoreKit

@main
struct Play_SongApp: App {

    @AppStorage("logged") var logged = false

    var body: some Scene {
        WindowGroup {
            if logged {
                ContentView()
            } else {
                LandscapeView()
                    .onOpenURL(perform: { url in
                    ApplicationDelegate.shared.application(UIApplication.shared,
                                                           open: url, sourceApplication: nil,
                                                           annotation: UIApplication.OpenURLOptionsKey.annotation)
                })
            }
        }
    }

    init() {
        FirebaseApp.configure()
        let db = Firestore.firestore()
    }
}
