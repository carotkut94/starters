//
//  NetworkManager.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared  = NetworkManager()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseUrl + "appetizers"
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init(){}
    
    //    func getStarters(completed: @escaping (Result<[Starter], FBError>) -> Void){
    //        guard let url = URL(string: appetizerURL) else {
    //            completed(.failure(.invalidUrl))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, response, error in
    //
    //            // if error is there go in, and raise error
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            // if respose is not correct and status code is not there go and raise the error (if let vs guar let)
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                let decodedResponse = try decoder.decode(StarterResponse.self, from: data)
    //                completed(.success(decodedResponse.request))
    //            }catch {
    //                completed(.failure(.invalidData))
    //            }
    //        }
    //
    //        task.resume()
    //    }
    
    // using async await and modern concurrency
    
    func getStarters() async throws -> [Starter] {
        guard let url = URL(string: appetizerURL) else {
            throw FBError.invalidUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(StarterResponse.self, from: data)
            return decodedResponse.request
        }catch {
            throw FBError.invalidData
        }
    }
    
    
    func downloadImage(fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void){
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string:urlString) else {
            completed(nil)
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
