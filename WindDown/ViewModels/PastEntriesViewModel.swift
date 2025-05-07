//
//  PastEntriesViewModel.swift
//  WindDown
//
//  Created by Lauren Galarza on 12/8/24.
//

import Foundation
import SwiftUI

class PastEntriesViewModel: ObservableObject {
    
    @Published  var journalHistory: [JournalEntry] = []  // For storing entries
    
    private let separator = "||"    // string that separates entries
    private let dateFormatter = ISO8601DateFormatter()
    
    //appstorage storedEntries
    //string containing all entries and dates
    //form of one entry:
        //"date|text"
    
    @AppStorage("journalEntries") var storedEntries: String = ""
    
    init() {
        loadEntries()
    }
    

    func loadEntries(){
        //separate entries that were concatonated together and stored in storedEntries
        
        journalHistory = []
        
        let entryString = storedEntries.split(separator: separator).map(String.init)

        
        for entryString in entryString {
            let components = entryString.split(separator: "|", maxSplits: 1).map(String.init)
            
           
            guard components.count == 2, let date = dateFormatter.date(from: components[0])
            else {
                continue
            }
            
            let text = components[1]
            journalHistory.append(JournalEntry(date: date, text: text))
            
        }

    }
    
    func saveEntry(_ entry: JournalEntry) {
        
    
        //save to journal history
        journalHistory.insert(entry, at: 0)
        
        
        
        let entryInput = "\(dateFormatter.string(from:entry.date))|\(entry.text)"
        
        //add new entry to storage
        storedEntries = "\(entryInput)\(separator)" + storedEntries
    }
    
    
    
    
    
    func deleteEntry(_ entry: JournalEntry) {
        if let i =  journalHistory.firstIndex(where: {$0.id == entry.id}) {
            
            journalHistory.remove(at: i)

            let encodedEntries = journalHistory.map {
                journalEntry in
                "\(dateFormatter.string(from:entry.date))|\(entry.text)"
            }.joined(separator: separator)
                
            storedEntries = encodedEntries
            
        }
    }
    
    
}

