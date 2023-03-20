//
//  ViewDrinks.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import SwiftUI

struct ViewDrinks: View {
    
    @State var results = [DrinkEntry]() // Eine leere Liste von Objekten
    let categoryName: String // Name der Kategorie
    let apiName: String // API-Endpunkt
    
    var body: some View {
        // Liste von DrinkEntry-Objekten
        List(results, id: \.id) { item in
            HStack(){
                VStack(alignment: .leading) {
                    Text(item.name) // Name des Getränks
                    Text(item.description) // Beschreibung des Getränks
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                }
                Text(item.price) // Preis des Getränks
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .listStyle(.inset)
        .onAppear(perform: loadData)
        .navigationTitle(categoryName)
    }
    // Die Funktion ruft die API auf
    func loadData() {
        guard let url = URL(string: "https://ba.0bdd.de/api/v1/ba/"+apiName) else {
                    print("Your API end point is Invalid")
                    return
                }
                let request = URLRequest(url: url)

                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data {
                        if let response = try? JSONDecoder().decode([DrinkEntry].self, from: data) {
                            DispatchQueue.main.async {
                                self.results = response
                            }
                            return
                        }
                    }
                }.resume()
    }
}
