//
//  ContentView.swift
//  Todo-SwiftData
//
//  Created by bjcecilio on 1/4/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var todoItems: [TodoItem] = []
    @State private var title: String = ""

    var body: some View {
        VStack {
            TextField("Enter Item Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    saveTodoItem()
                }

            List(todoItems) { todoItem in
                Text(todoItem.title)
            }
        }
        .padding()
    }

    private func saveTodoItem() {
        // create the item
        let item = TodoItem(title: title)
        // save the item
        context.insert(item)

        title = ""
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
