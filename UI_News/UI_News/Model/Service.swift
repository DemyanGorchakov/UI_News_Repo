//
//  Service.swift
//  UI_News
//
//  Created by Демьян Горчаков on 18.02.2023.
//

import Foundation

class Service {
    
    func getUsers(completion: @escaping (People) -> ()) {
        
        let url = URL(string: "https://dummyjson.com/users")!
        
        //        var urlComponents = URLComponents(string: baseUrl)!
        //        urlComponents.queryItems = [
        //        URLQueryItem(name: "", value: ""),
        //        URLQueryItem(name: "", value: "")
        //        ]
        
        //        let url = urlComponents.url!
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {( data, responce, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let responce = try! decoder.decode(People.self, from: data)
                    completion(responce)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
