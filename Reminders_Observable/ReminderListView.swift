//
//  ReminderListView.swift
//  Reminders_Observable
//
//  Created by Charles Michael on 3/3/25.
//

import SwiftUI

struct ReminderListView: View {
    @Environment(\.storage) private var storage
    
    var body: some View {
        NavigationStack {
            List(storage.reminders){ reminder in
                NavigationLink(value: reminder){
                    ReminderRowView(reminder: reminder)
                        .onSubmit {
                            storage.purgeEmptyReminders()
                        }
                }
                .swipeActions {
                    Button("Delete", role: .destructive){
                        storage.remove(reminder: reminder)
                    }
                }
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar){
                    Button {
                        let newReminder = Reminder(title: "")
                        storage.add(reminder: newReminder)
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("New Reminder")
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Reminders (\(storage.flaggedReminders().count) flagged, \(storage.reminders(withPriority: .high).count) high)")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Reminder.self) { reminder in
                ReminderView(reminder: reminder)
            }
            .onAppear {
                storage.purgeEmptyReminders()
            }
        }
    }
}

#Preview {
    ReminderListView()
        .environment(\.storage, Storage(reminders: Reminder.samples))
}
