//
//  Service.swift
//  E-shop
//
//  Created by Vyacheslav on 31.01.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import Foundation



struct Us: Decodable {
    let id: Int
    let username: String
}

class Service {
    
    static let shared = Service()
    
    //MARK: - REST API methods
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
    
    func registerAccount(username: String, password: String, completion: @escaping (Bool)->()) {
        guard let url = URL(string: "http://smktesting.herokuapp.com/api/register/") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = ["username" : username, "password" : password]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {return}
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [String: Any]
                    dict?.forEach({ (obj) in
                        print(obj)
                        if obj.key == "message" {
                            completion(false)
                        } else if obj.key == "token" {
                            completion(true)
                        }
                    })
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func loginAccount(username: String, password: String, completion: @escaping (Bool)->()) {
        guard let url = URL(string: "http://smktesting.herokuapp.com/api/login/") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = ["username" : password, "password" : password]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {return}
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [String: Any]
                    dict?.forEach({ (obj) in
                        print(obj)
                        if obj.key == "message" {
                            completion(false)
                        } else if obj.key == "token" {
                            self.findUserID(username: username) { (userID) in
                                let user = User(id: userID, username: username, password: password)
                                print("user: ", user)
                            }
                            completion(true)
                        }
                    })
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func findUserID(username: String, completion: @escaping (Int)->()) {
        guard let url = URL(string: "http://smktesting.herokuapp.com/api/register/") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let err = err {
                print("Failed to load products:", err)
            }
            if let resp = response {
                print(resp)
            }
            if let data = data {
                do {
                    print("finding user ID")
                    if let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [String: Any] {
                        // search two-dimensional users dictionary
                        dict.keys.forEach({ (key) in
                            if key == "results" {
                                guard let arr: [[String:Any]] = dict[key] as? [[String : Any]] else {
                                    print("fail")
                                    return
                                }
                                //serch user id
                                arr.forEach { (pair) in
                                    print(pair)
                                    if pair["username"] as! String == username {
                                        let id = pair["id"] as! Int
                                        completion(id)
                                    }
                                }
                                return
                            }
                        })
                    }
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
    
    //MARK: - UserDefaults methods
    
    let defs = UserDefaults.standard
    
    func serializeCurrentUser(user: User) {
        defs.set(try? PropertyListEncoder().encode(user), forKey: "user")
    }
    
    func serializeUserToken(token: String) {
        defs.set(try? PropertyListEncoder().encode(token), forKey: "token")
    }
    
}
