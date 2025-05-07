//
//  HomeView.swift
//  WindDown
//
//  Created by Lauren Galarza on 11/17/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isVisible = false //var for animation
    
    
    var body: some View {
       
        ZStack{
            Color.homeBackground
                .edgesIgnoringSafeArea(.all)
       
            VStack{
       
                Text("Wind Down")
                    .font(Font.custom("Jaro", size: 64))
                    .foregroundStyle(Color.titleText)
                    .shadow( radius: 2, y: 5)
                    .opacity(isVisible ? 1 : 0)
                    .offset(y: isVisible ? 0 : -20)
                
                
                        Text("Welcome to Wind Down: A  companion for your nightly routine with journaling, soothing sounds, and personalized weather insights. \n\n Head over to the journal tab to start!")
                            .font(Font.custom("Jaro", size: 25))
                            .tracking(1)
                            .foregroundStyle(Color.titleText)
                            .padding()
                            .opacity(isVisible ? 1 : 0)
                            .offset(y: isVisible ? 0 : -15)
                    
                    .background(Rectangle()
                        .fill( Color.homeBackground)
                        .shadow( radius: 2)
                        .opacity(isVisible ? 1 : 0)
                        .offset(y: isVisible ? 0 : -20)
                                
                    )
                //.shadow( radius: 2, y: 5)
                    .padding(.top, -20)
         

            }
            .onAppear {
                
                withAnimation(.easeIn(duration: 1)) {
                    
                    isVisible = true
                    
                }
                
            }

        }
             
    }
                
}
        

#Preview {
    HomeView()
}
