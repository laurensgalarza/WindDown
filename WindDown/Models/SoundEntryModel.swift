//  SoundEntryModel.swift
//  WindDown
//  Created by Lauren Galarza on 12/9/24.
//  Model for Sound Entry used in SoundViewModel

import Foundation
import SwiftUI
import AVFoundation

struct SoundEntry: Identifiable {
    let id = UUID() // Unique ID for each sound
    let name: String // Display name of the sound
    let fileName: String //file name for audio
    let fileType: String //ex. mp3 or wav
}
