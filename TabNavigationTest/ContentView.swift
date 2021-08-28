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
            MenuView()
                .tabItem {
                    Image(systemName: "filemenu.and.selection")
                    Text("Menu")
                }
                .tag(1)
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
                .tag(2)
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(3)
            GalleryView()
                .tabItem {
                    Image(systemName: "photo.on.rectangle")
                    Text("Gallery")
                }
                .tag(4)
            InfoView()
                .tabItem {
                    Image(systemName: "info")
                    Text("Info")
                }
                .tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
