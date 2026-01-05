//
//  TodoViewModel.swift
//  Todo-SwiftData
//
//  Created by bjcecilio on 1/4/26.
//

import Foundation
import SwiftData
import Observation

@Observable
final class TodoViewModel {
    var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func saveTodoItem(title: String) {
        // create the item
        let item = TodoItem(title: title)
        // save the item
        modelContext.insert(item)
        // Changes automatically propagate to the @Query in the View
    }

    func deleteTasks(offsets: IndexSet, from tasks: [TodoItem]) {
        for index in offsets {
            modelContext.delete(tasks[index])
        }
    }
}
