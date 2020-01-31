//
//  Service.swift
//  E-shop
//
//  Created by Vyacheslav on 31.01.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    fileprivate func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    func downloadImage(from url: URL, completion: @escaping (Data) -> ()) {
        getData(from: url) { data, response, error in
            if let error = error {
                print("Failed to download image:", error)
            } else if let data = data {
                print("Success")
                print(response?.suggestedFilename ?? url.lastPathComponent)
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }
    }
    
    func registerAccount(username: String, password: String) {
        guard let url = URL(string: "http://smktesting.herokuapp.com/api/register/") else {return}
        var register = URLRequest(url: url)
        register.httpMethod = "POST"
        register.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = ["username" : password, "password" : password]        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {return}
        register.httpBody = httpBody
        URLSession.shared.dataTask(with: register) { (data, response, err) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func loadProducts(completion: @escaping ([Product])->()) {
        guard let url = URL(string: "http://smktesting.herokuapp.com/api/products/") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let err = err {
                print("Failed to load products:", err)
            }
            if let data = data {
                do {
                    let products = try JSONDecoder().decode([Product].self, from: data)
                    completion(products)
                } catch {
                    print(error)
                }
                
            }
        }.resume()
    }
}
