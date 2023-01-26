//
//  RestApi.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import Foundation

struct Blink: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var measure: String
    var price: String
    
}


class Api : ObservableObject {
    @Published var drinks = [Drink]()
    
    func loadApi(completion: @escaping (Data?, Error?) -> Void) {
        let url = URL(string: "http://127.0.0.1:5000/api/v1/ba/softdrinks")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
        task.resume()
    }
}
