//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Aleksey Konchyts on 20.11.24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var description = ""

    var onSave: (Task) -> Void

    var body: some View {
        NavigationView {
            Form {
                TextField("Название", text: $title)
                TextField("Описание", text: $description)
            }
            .navigationTitle("Новая задача")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Сохранить") {
                        let newTask = Task(
                            title: title,
                            details: description,
                            date: Date(),
                            isCompleted: false
                        )
                        onSave(newTask)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
            }
        }
    }
}




