//
//  JournalViewModel.swift
//  WindDown
//
//  Created by Lauren Galarza on 12/8/24.
//

import Foundation
import SwiftUI

class JournalViewModel: ObservableObject {
    
    @Published  var currentEntryText: String = "Dear diary," // For  text editor
    @Published  var currentDate = Date.now // Current date
    
    
        
    func saveEntry(to pastEntriesViewModel: PastEntriesViewModel){
        
        //Check if entry is empty
        if (currentEntryText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            return
        }
        
        //save
            //create new entry with current text
        
        let newEntry = JournalEntry(date: currentDate, text: currentEntryText)
    
            // save new entry to journal history
        pastEntriesViewModel.saveEntry(newEntry)
        
        
            //clear text from current entry
        currentEntryText = "Dear diary,"
        
    }
    
}

