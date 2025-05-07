//  SettingsView.swift
//  WindDown
//  Created by Lauren Galarza on 11/17/24.
//  Displays saved past journal entries and allows deleting.

import SwiftUI

struct PastEntriesView: View {
    @EnvironmentObject var pastEntriesViewModel: PastEntriesViewModel

    var body: some View {

        ZStack{
            
            Color.journalButtonBackground.ignoresSafeArea()
            
            VStack{
                Text("Past Entries")
                    .foregroundStyle(Color.journalAccent1)
                    .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                    .shadow(radius: 2, y: 5)
                
                //List display entries as cards
                List(pastEntriesViewModel.journalHistory){ entry in
                    HStack{
                        CustomCardView(date: entry.date, text: entry.text)
                            .listRowBackground(Color.journalButtonBackground)
                        
                        Spacer()
                        
                        Button(action: {pastEntriesViewModel.deleteEntry(entry)}) {
                            Text("Delete")
                                .buttonModifier()
                                .foregroundStyle(Color.journalAccent1)
                                .background(Color.journalButtonText)
                                .contentShape(Rectangle())
                            
                        }
                        .frame(alignment: .trailing)
                        .frame(maxWidth: 100)
                        .buttonStyle(BorderedButtonStyle())
                        
                    }
                    
                    
                    .listRowBackground(Color.journalButtonBackground)
                    
                }
                .listStyle(.plain) // Use plain list style
                .background(Color.journalButtonBackground)
                //.background(Color.journalAccent2)
                .scrollContentBackground(.hidden)
                
            }
            .background(Color.journalButtonBackground)

        }
    
    }
}

#Preview {
    PastEntriesView()
        .environmentObject(PastEntriesViewModel())
}
