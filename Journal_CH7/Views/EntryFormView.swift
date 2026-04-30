//
//  EntryFormView.swift
//  Journal_CH7
//
//  Created by jeffrey lullen on 4/28/26.
//

import SwiftUI
import SwiftData

struct EntryFormView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let entry:JournalEntry?
    
    @State private var title:String = ""
    @State private var entryBody:String = ""
    @State private var isFavorite:Bool = false
    
    var body: some View {
        Form{
            Section("Title"){
                TextField("Title", text: $title)
            }
            Section("Body"){
                ZStack(alignment: .topLeading){
                TextEditor(text: $entryBody)
                    .frame(minHeight: 200)
                    if entryBody.isEmpty{
                        Text("Write your entry here")
                            .foregroundStyle(.secondary)
                            .padding(.top, 8)
                    }
                }
            }
            Section("Favorite"){
                Toggle("You like?", isOn: $isFavorite)
            }
        }
        .navigationTitle(entry == nil ? "New Entry" : "Edit Entry")
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button("Cancel"){dismiss()}
            }
            
            ToolbarItem(placement: .topBarTrailing){
                Button("Save"){ save()
                }
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .onAppear{
            guard let entry else {return}
            title = entry.title
            entryBody = entry.body
            isFavorite = entry.isFavorite
        }
    }// end body
    private func save() {
        let t = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let b = entryBody.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !t.isEmpty else {return}
        if let entry {
            entry.title = t
            entry.body = b
            entry.isFavorite = isFavorite
        } else {
            context.insert(JournalEntry(title: t, body: b, isFavorite: isFavorite))
        }
        dismiss()
    }
}//end struct
    
//#Preview{
//    NavigationStack{
//        EntryFormView(entry: nil)
//    }
//}
