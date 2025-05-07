//  CustomCardView.swift
//  WindDown
//  Created by Lauren Galarza on 12/9/24.
//  Card view for past journal entries
import Foundation
import SwiftUI

struct CustomCardView: View {
    
    let date: Date  //date of journal entry
    let text: String    //entry text
    
    var body: some View {
        
        ZStack {
            Color.journalButtonBackground
            
            VStack{
                //Date at top, format: Weekday, Month Day
                Text(date.formatted(.dateTime.weekday(.wide).month(.wide).day()))
                    .font(Font.custom("Jaro", size: 22))
                    .foregroundColor(Color.journalButtonText)
                    .shadow(radius: 2, y: 2)
                
                Spacer()
                //entry text
                Text(text)
                    .font(Font.custom("Jaro", size: 15))
                    .foregroundColor(Color.journalButtonText)
                
            }
            .padding()
            .background(Color.journalAccent1
                .shadow(radius: 2, y: 5))

        }
        
    }
    
}
