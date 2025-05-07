//  JournalEntryModel.swift
//  WindDown
//  Created by Lauren Galarza on 12/9/24.
//  Model for Journal Entry in JournalView

import Foundation
import SwiftUI

struct JournalEntry: Identifiable {
    let id = UUID() //Unique ID for each entry
    let date: Date //Date of entry
    let text: String //entry text
}
