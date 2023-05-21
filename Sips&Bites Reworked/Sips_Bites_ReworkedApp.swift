//
//  Sips_Bites_ReworkedApp.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 27/04/2023.
//

import SwiftUI

@main
struct Sips_Bites_ReworkedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            startingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
