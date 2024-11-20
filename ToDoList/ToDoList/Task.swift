//
//  Task.swift
//  ToDoList
//
//  Created by Aleksey Konchyts on 20.11.24.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var details: String
    var date: Date
    var isCompleted: Bool
}
