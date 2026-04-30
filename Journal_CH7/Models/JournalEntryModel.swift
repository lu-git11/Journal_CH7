//
//  JournalEntryModel.swift
//  Journal_CH7
//
//  Created by jeffrey lullen on 4/28/26.
//

import Foundation // basic types, functions,
import SwiftData // handles persistance

@Model
class JournalEntry {
    var title: String
    var body: String
    var date: Date
    var isFavorite: Bool
    
    init(title:String, body:String, date:Date = .now, isFavorite:Bool = false) {
        self.title = title
        self.body = body
        self.date = date
        self.isFavorite = isFavorite
    }
}
