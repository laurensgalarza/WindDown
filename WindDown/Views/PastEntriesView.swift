//
//  SettingsView.swift
//  WindDown
//
//  Created by Lauren Galarza on 11/17/24.
//

import SwiftUI

struct PastEntriesView: View {
    @EnvironmentObject var pastEntriesViewModel: PastEntriesViewModel

    var body: some View {

      ZStack{
          
          
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
                      
                  }
                  .frame(alignment: .trailing)
                  .frame(maxWidth: 100)
                  
                  .contentShape(Rectangle())

              }

              
              .listRowBackground(Color.journalButtonBackground)
              
           }
            .listStyle(.plain) // Use plain list style
            .background(Color.journalButtonBackground)
            //.background(Color.journalAccent2)
            
        }
        
    
        
    }
}

#Preview {
    PastEntriesView()
        .environmentObject(PastEntriesViewModel())
}
