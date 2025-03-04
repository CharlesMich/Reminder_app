//
//  Reminders_ObservableApp.swift
//  Reminders_Observable
//
//  Created by Charles Michael on 2/26/25.
//

import SwiftUI

@main
struct Reminders_ObservableApp: App {
    @State private var storage = Storage(reminders: Reminder.samples)
    var body: some Scene {
        WindowGroup {
            ReminderListView()
                .environment(\.storage, storage)
        }
    }
}
