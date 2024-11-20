//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Aleksey Konchyts on 20.11.24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
