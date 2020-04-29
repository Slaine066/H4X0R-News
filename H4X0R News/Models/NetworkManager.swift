//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Giuseppe Gioi on 24/03/2020.
//  Copyright © 2020 Giuseppe Gioi. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject { // Makes the instantiated object "Observable"
    
    @Published var posts = [Post]() // Notify the ObservedObject when this property changes
    
    func fetchData() {
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    let decoder = JSONDecoder()
        
                    if let safeData = data {
                        do {
                            let result = try decoder.decode(Result.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
