//
//  ContentView.swift
//  WindDown
//
//  Created by Lauren Galarza on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pastEntriesViewModel = PastEntriesViewModel()
    
    var body: some View {
        
            TabView {
                
                HomeView()
                    .tabItem{
                        Label("Overview", systemImage: "house")
                    }

                JournalView(viewModel: JournalViewModel())
                    .tabItem{ Label("Journal", systemImage: "square.and.pencil")}
                    
                    
                SoundView()
                    .tabItem{ Label("Sounds", systemImage: "headphones")}
                   
                InsightsView()
                    .tabItem{ Label("Insights", systemImage: "cloud")}
                
            }
            .onAppear {
                
                // Customize the tab bar appearance when the view appears
                let appearance = UITabBarAppearance()
                
                UITabBar.appearance().isTranslucent = true
                
                appearance.stackedLayoutAppearance.selected.iconColor = UIColor.journalAccent1
                appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.journalAccent1]
                
                appearance.stackedLayoutAppearance.normal.iconColor = UIColor.titleText
                appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.titleText]
                
                UITabBar.appearance().standardAppearance = appearance
                
                
            }
        

            .environmentObject(pastEntriesViewModel)
            
    }
   
}


#Preview {
    ContentView()
}
