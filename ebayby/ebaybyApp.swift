//
//  ebaybyApp.swift
//  ebayby
//
//  Created by Arpan Dhatt on 1/16/21.
//

import SwiftUI

@main
struct ebaybyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView(model: ViewModel())
        }
    }
}
