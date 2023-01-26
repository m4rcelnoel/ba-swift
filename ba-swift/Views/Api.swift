//
//  Api.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import Foundation

struct MenuData: Codable, Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var price: String
    
}

class Api : ObservableObject {
    @Published var drinks = [MenuData]()
    
    func loadData(completion:@escaping ([MenuData]) -> ()) {
        guard let url = URL(string: "http://localhost:5000/api/v1/ba/softdrinks") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let drinks = try! JSONDecoder().decode([MenuData].self, from: data!)
            print(drinks)
            DispatchQueue.main.async {
                completion(drinks)
            }
        }.resume()
    }
}
