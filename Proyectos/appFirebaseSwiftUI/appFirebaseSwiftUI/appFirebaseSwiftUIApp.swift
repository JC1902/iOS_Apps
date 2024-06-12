//
//  appFirebaseSwiftUIApp.swift
//  appFirebaseSwiftUI
//
//  Created by Ivanovicx Nuñez on 10/06/24.
//

import SwiftUI
import Firebase

@main
struct appFirebaseSwiftUIApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject( dataManager )
        }
    }
}
