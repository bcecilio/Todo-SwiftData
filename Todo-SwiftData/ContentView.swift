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

    @State var viewModel: TodoViewModel

    init(context: ModelContext) {
        self.viewModel = TodoViewModel(modelContext: context)
    }

    var body: some View {
        VStack {
            TextField("Enter Item Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    viewModel.saveTodoItem(title: title)
                }

            List {
                ForEach(todoItems) { item in
                    Text(item.title)
                }
                .onDelete { indexSet in
                    viewModel.deleteTasks(offsets: indexSet, from: todoItems)
                }
            }
        }
        .padding()
        .onAppear {
            viewModel = TodoViewModel(modelContext: context)
        }
    }
}
