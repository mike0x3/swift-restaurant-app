//
//  ContentView.swift
//  TabNavigationTest
//
//  Created by Uno qualunque on 26/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 3
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MenuView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "filemenu.and.selection")
                    Text("Menu")
                }
                .tag(1)
            NewsView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
                .tag(2)
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(3)
            GalleryView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "photo.on.rectangle")
                    Text("Gallery")
                }
                .tag(4)
            InfoView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "info")
                    Text("Info")
                }
                .tag(5)
        }
    }
    func moveTo(screen: Int) {
        selectedTab = screen
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
