//
//  ViewDrinks.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import SwiftUI

struct ViewDrinks: View {
    
    @State var results = [DrinkEntry]()
    let categoryName: String
    let apiName: String
    
    var body: some View {

        List(results, id: \.id) { item in
            HStack(){
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text(item.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                }
                Text(item.price)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
        }
        .listStyle(.inset)
        .onAppear(perform: loadData)
        .navigationTitle(categoryName)
    }
    
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
