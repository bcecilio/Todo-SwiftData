//
//  TodoViewModel.swift
//  Todo-SwiftData
//
//  Created by bjcecilio on 1/4/26.
//

import Foundation
import SwiftData

@Observable
final class TodoViewModel {
    private var worker: TodoBackgroundWorker

    init(modelContainer: ModelContainer) {
        // Create the worker with the shared container
        self.worker = TodoBackgroundWorker(modelContainer: modelContainer)
    }

    func saveTodoItem(title: String) {
        Task {
            await worker.saveItem(title: title)
        }
    }

    func deleteTasks(offsets: IndexSet, from tasks: [TodoItem]) {
        // Collect IDs since TodoItem is not Sendable and can't cross actor boundaries
        let idsToDelete = offsets.map { tasks[$0].persistentModelID }

        Task {
            await worker.deleteItems(ids: idsToDelete)
        }
    }
}

@ModelActor
actor TodoBackgroundWorker {
    func saveItem(title: String) {
        let item = TodoItem(title: title)
        modelContext.insert(item)
        try? modelContext.save() // Background saves don't block the UI
    }

    func deleteItems(ids: [PersistentIdentifier]) {
        for id in ids {
            // Fetch the item in the worker's own context before deleting
            if let item = modelContext.model(for: id) as? TodoItem {
                modelContext.delete(item)
            }
        }
        try? modelContext.save()
    }
}
