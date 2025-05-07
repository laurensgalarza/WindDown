//
//  JournalView.swift
//  WindDown
//
//  Created by Lauren Galarza on 11/17/24.
//

import SwiftUI


struct JournalView: View {
    
    @StateObject var viewModel: JournalViewModel
    @EnvironmentObject var pastEntriesViewModel: PastEntriesViewModel

    var body: some View {
        
        //able to navigate to PastEntriesView
        NavigationStack{
            
            ZStack{
                
                Color.journalViewBackground
                    .ignoresSafeArea()
                VStack{
                    
                    Text("Reflect On Your Day")
                        .foregroundStyle(Color.journalAccent1)
                        .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                        .shadow(radius: 2, y: 5)
                        
                
                VStack(){
                    
                    //Text Editor display
                    
                    HStack{
                        //date
                        Text(viewModel.currentDate, format: .dateTime.weekday(.wide).month(.wide).day())
                            .foregroundStyle(Color.journalAccent1)
                            .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .title3).pointSize))
                            .tracking(2)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.journalViewBackground)
                        
                            .frame(alignment: .leading)
                        
                        Spacer()
                        
                        //save button
                        Button(action: {viewModel.saveEntry(to: pastEntriesViewModel)}) {
                            Text("Save")
                                .foregroundStyle(Color.journalAccent1)
                                .buttonModifier()
                                .background(Color.journalViewBackground)
                        }
                        .frame(alignment: .trailing)
                        .contentShape(Rectangle())
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
            
                    //Entry text box
                    TextEditor(text: $viewModel.currentEntryText)
                        .cornerRadius(10)
                    
                        .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .body).pointSize))
                        .foregroundStyle(Color.journalButtonText)
                        .ignoresSafeArea(.keyboard)
                        .background(Color.journalAccent2
                            .shadow(radius: 2, y: 5))
                        .scrollContentBackground(.hidden)
                        .padding()
                    
                    Spacer()
                        .frame(maxHeight: 0.5)
                    
                    //navigate to PastEntries VIew
                    NavigationLink(destination:
                                    NavigationStack{
                        PastEntriesView()}
                    ){
                        Rectangle()
                            .fill(Color.journalViewBackground)
                            .frame(maxHeight: 50)
                            .padding(.horizontal, 2)
                            .shadow(radius: 2, y: 5)
                            .overlay(
                                Text("Go To Journal Entries")
                                    .tracking(1.5)
                                    .font(Font.custom("Jaro", size: UIFont.preferredFont(forTextStyle: .title3).pointSize))
                                    .foregroundStyle(Color.journalAccent1)
                            )
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                }
                .background(
                    Rectangle()
                        .fill( Color.journalAccent1)
                        .shadow( radius: 2, y: 5)
                    
                )
            }
                .padding(.vertical, 10)
                .padding()
                .safeAreaPadding()
            }
            
        }
        
    }
    
}

#Preview {
    JournalView(viewModel: JournalViewModel())
        .environmentObject(PastEntriesViewModel())
        
}
