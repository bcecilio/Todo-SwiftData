//
//  Todo_SwiftDataApp.swift
//  Todo-SwiftData
//
//  Created by bjcecilio on 1/4/26.
//

import SwiftUI
import SwiftData

@main
struct Todo_SwiftDataApp: App {
    // Define the container
    var container: ModelContainer

    init() {
        do {
            // Initialize the storage
            container = try ModelContainer(for: TodoItem.self)
        } catch {
            fatalError("Failed to configure SwiftData Container")
        }
    }

    var body: some Scene {
        WindowGroup {
            // Pass the context from the container directly to the View's init
            ContentView(context: container.mainContext)
        }
        // Still apply the modifier so @Query works inside the View
        .modelContainer(container)
    }
}
