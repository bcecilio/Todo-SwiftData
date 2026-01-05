# Todo-SwiftData
Simple todo app, built with SwiftUI and SwiftData. The goal for this project is to learn about SwiftData.

## SwiftData Findings
### `.modelContainer(for:)
This modifier is set at the app's entry point, this modifier initializes the persistent storage for the `TodoItem` model.

### `@Environment(\.modelContext)`
This property wrapper gives the view access to the data.
  * `modelContext.insert(task)` - saves the todo items
  * `modelContext.delete(task)` - removes the todo items.

### `@Query`
The most powerful part of SwiftData, I think..
  * What it does: it replaces the need for manual fetching for simple data retreival.
  * Fetch tasks directly into a Swift array: `@Query var tasks: [TodoItem]`
  * The best part: you can add or delete items via the `@Environment(\.modelContext) private var context`, while `@Query` detects the change and automatically refreshes the UI, keeping the list in sync with the database.


