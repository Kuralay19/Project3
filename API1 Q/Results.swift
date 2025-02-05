//
//  Results.swift
//  API1 Q
//
//  Created by Smart Castle M1A2010 on 05.11.2023.
//

import Foundation
class Service: NSObject, URLSessionDelegate {
    static let shared = Service()
    
    func fetchJsonData(urlString: String, completion: @escaping (MoviesResult?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.httpMethod = "POST"
//        request.httpMethod = "DELETE"
        request.setValue("api_key", forHTTPHeaderField: "cdc1246611ec11843c40ff21f57918be")
                request.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
                request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZGMxMjQ2NjExZWMxMTg0M2M0MGZmMjFmNTc5MThiZSIsInN1YiI6IjVlNzA5ZjNmMzU3YzAwMDAxOTQ2Yjc0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5BUjUfRnF6dewGIR1LQ2Dsfh-hqKLENLqXCyvsk9LPI", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, err) in
        
        if let err = err {
            completion(nil, err)
            return
        }
        do {
            let objects = try JSONDecoder().decode(MoviesResult.self, from: data!)
            completion(objects,nil)
            
        }
        catch {
            completion (nil,error)
            print("Failed to decode", error)
        }
        
    }.resume()
    
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            // Handle authentication challenge if needed
            // ...
        }
}

