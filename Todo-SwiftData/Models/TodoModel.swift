//
//  TodoModal.swift
//  Todo-SwiftData
//
//  Created by bjcecilio on 1/4/26.
//

import Foundation
import SwiftData

@Model
class TodoItem {
    // item title
    // item completion
    // item date created? - post MVP
    // item date completed? - post MVP

    var title: String
    var completion: Bool

    init(title: String, completion: Bool = false) {
        self.title = title
        self.completion = completion
    }
}
