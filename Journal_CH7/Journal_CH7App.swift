//
//  Journal_CH7App.swift
//  Journal_CH7
//
//  Created by jeffrey lullen on 4/28/26.
//

import SwiftUI
import SwiftData

@main
struct Journal_CH7App: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack { 
                EntryListView()
            }
        }
        .modelContainer(for: JournalEntry.self)
    }
}
