//
//  NetworkManager.swift
//  Appetizer
//
//  Created by apple on 2024/5/23.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer]{
        
        guard let url = URL(string: NetworkManager.baseURL) else {
            throw APError.invalidURL
        }
        
        let (data,_) = try await URLSession.shared.data(from:url)
        
        do{
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
            
        }catch{
            throw APError.invalidData
        }
        
        
    }
    
    func downloadImage(fromURLString urlString:String,completed:@escaping(UIImage?)->Void){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data)else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        
        task.resume()
        
    }
    
}
