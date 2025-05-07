//
//  SoundView.swift
//  WindDown
//
//  Created by Lauren Galarza on 11/17/24.
//

import SwiftUI
import AVFoundation

struct SoundView: View {
    
    @StateObject private var viewModel = SoundViewModel()

    var body: some View {

        
        ZStack{
            
            Color.soundsAccent2
                .ignoresSafeArea()

        VStack{
            
            Spacer()
            
            Text("Select Meditative Sound")
                .foregroundStyle(Color.soundsAccent3)
                .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                .padding()
                .shadow( radius: 2, y: 5)
               

            Rectangle()
                .fill(Color.soundsAccent3)
                .shadow( radius: 2, y: 5)
                .overlay(
                    
                    Text("Relax with this collection of soothing sounds, specifically curated to help you unwind before sleep.")
                        .foregroundStyle(Color.soundsAccent2)
                        .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .title3).pointSize))

                    
                )
                .frame(maxHeight: 100)
                .padding()
                
                  

               
            List(viewModel.sounds) { sound in
                    //sound name
                    HStack{
                        
                        Text(sound.name) // Display each sound's name
                            
                                .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .title3).pointSize))
                                .foregroundStyle(Color.soundsAccent3)
                            
                               
                            
                            //if playing, display text "playing"
                            Spacer()
                        
                        if viewModel.currentlyPlaying == sound.id {
                                Text("Playing")
                                    .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .caption1).pointSize))
                                    .foregroundStyle(Color.soundsAccent3)
                                    
                                    
                            }
                    }
                        .contentShape(Rectangle())
                        .listRowBackground(Color.soundsAccent1)
                        .listRowSpacing(20)
                        .listRowSeparatorTint(Color.soundsAccent2)
                    
                        .onTapGesture {
                                       
                            viewModel.toggleSound(sound: sound)
                                   }
                       
                   }
                    .scrollContentBackground(.hidden) // Hide default list background
                    .listStyle(.plain) // Use plain list style

                    
                    .padding(.vertical, 5) // Space around each row
                }
            
                      
            }
           

    }
                    
    
   
}




#Preview {
    SoundView()
}
