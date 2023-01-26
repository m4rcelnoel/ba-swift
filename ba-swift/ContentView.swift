//
//  ContentView.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ViewMenuCard()
                .tabItem() {
                    Image(systemName: "phone.fill")
                    Text("Home")
                }
            ViewContact()
                .tabItem() {
                    Image(systemName: "person.fill")
                    Text("Kontakt")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
