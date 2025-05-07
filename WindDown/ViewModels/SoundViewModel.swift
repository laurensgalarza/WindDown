//
//  SoundViewModel.swift
//  WindDown
//
//  Created by Lauren Galarza on 12/8/24.
//

import Foundation
import SwiftUI
import AVFoundation

class SoundViewModel: ObservableObject {
    
    @Published var player: AVAudioPlayer?   //for playing audio files
    @Published var currentlyPlaying: UUID? // Tracks the currently playing sound
    @Published var isPlaying = false    //
    
    // List of meditative sounds
    let sounds: [SoundEntry] = [
        SoundEntry(name: "Gentle Rain", fileName: "gentle_rain", fileType: "wav"),
        SoundEntry(name: "Heavy Rain", fileName: "heavy_rain", fileType: "wav"),
        SoundEntry(name: "Thunderstorm", fileName: "thunderstorm", fileType: "wav"),
        SoundEntry(name: "Winter Wind", fileName: "winter_wind", fileType: "wav"),
        SoundEntry(name: "Birds", fileName: "birds", fileType: "wav"),
        SoundEntry(name: "Fireplace", fileName: "fireplace", fileType: "mp3"),
        SoundEntry(name: "Sea Waves", fileName: "sea_waves", fileType: "wav"),
        SoundEntry(name: "White Noise", fileName: "white_noise", fileType: "wav"),
        SoundEntry(name: "Pink Noise", fileName: "pink_noise", fileType: "wav"),
        SoundEntry(name: "Brown Noise", fileName: "brown_noise", fileType: "wav"),

    ]



    
    
    func toggleSound (sound: SoundEntry){
        //play audio tapped on
            //find audio file
            // use guard for if file cannot be found
        guard let url = Bundle.main.url(forResource: sound.fileName, withExtension: sound.fileType)
        else{
            print("Sound not found: \(sound.fileName). \(sound.fileType)")
            return
        }
           
            //set up audioplayer for selected file
            //catch if fails
        
        do {
            if !isPlaying{
                
                player = try AVAudioPlayer(contentsOf: url)
               
                player?.play()
                player?.numberOfLoops = -1
                currentlyPlaying = sound.id
                isPlaying = true

            }
            else{
                player?.stop()
                isPlaying = false
                currentlyPlaying = nil
            }

        }
        catch{
            print("Sound failed to play \(sound.fileName). \(sound.fileType)")
        }
        
        
    }
    
    
    
    
}

