//
//  TaskListView.swift
//  ToDoList
//
//  Created by Aleksey Konchyts on 20.11.24.
//

import SwiftUI


struct TaskListView: View {
    @State private var searchText = ""
    @State private var tasks: [Task] = []
    @State private var showAddTaskView = false

    var filteredTasks: [Task] {
        if searchText.isEmpty {
            return tasks
        } else {
            return tasks.filter { $0.title.contains(searchText) || $0.details.contains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($tasks) { $task in
                        TaskRow(task: $task)
                    }
                    .onDelete { indexSet in
                        deleteTask(at: indexSet)
                    }
                }
                .searchable(text: $searchText, prompt: "Search")
                .navigationTitle("Задачи")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(tasks.count) Задач")
                            .font(.headline)
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {
                            showAddTaskView.toggle()
                        }) {
                            Image(systemName: "square.and.pencil")
                                .font(.title2)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView { newTask in
                tasks.append(newTask)
            }
        }
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct TaskRow: View {
    @Binding var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            VStack(alignment: .leading) {
                Text(task.title)
                    .strikethrough(task.isCompleted, color: .black)
                Text(task.details)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(task.date, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
