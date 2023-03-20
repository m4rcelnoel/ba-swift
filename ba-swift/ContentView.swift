//
//  ContentView.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Registerkartenansicht (Bottom-Navigation)
        TabView {
            ViewMenuCard()
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            ViewContact()
                .tabItem() {
                    Image(systemName: "info")
                    Text("Info")
                }
        }
    }
}
// Wird verwendet, um eine Vorschau der ContentView-Ansicht in Xcode anzuzeigen
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
