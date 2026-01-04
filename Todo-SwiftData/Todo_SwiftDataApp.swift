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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: TodoItem.self)
        }
    }
}
