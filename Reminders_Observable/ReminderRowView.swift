//
//  ReminderRowView.swift
//  Reminders_Observable
//
//  Created by Charles Michael on 2/27/25.
//

import SwiftUI

struct ReminderRowView: View {
    
    @Bindable var reminder: Reminder
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                if reminder.priority != .none {
                    Text(reminder.priority.shortDescription)
                        .foregroundStyle(.blue)
                }
                TextField("New Remainder", text: $reminder.title)
                    .focused($isFocused)
                Spacer()
                if reminder.flag {
                    Image(systemName: "flag.fill")
                        .foregroundStyle(.orange)
                }
            }
            Text(reminder.notes)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .lineLimit(3)
        }
        .onAppear {
            if reminder.isEmpty {
                isFocused = true
            }
        }
    }
}

#Preview {
    ReminderRowView(reminder: .sample)
}
