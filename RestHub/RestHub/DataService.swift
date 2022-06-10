//
//  DataService.swift
//  RestHub
//
//  Created by gustavo.salazar on 10/06/22.
//

import Foundation


class DataService{
     static let shared = DataService()
     fileprivate let baseURLString = "https://app.github.com"
    
    func fecthGits(completion: @escaping(Result<[Gist],Error>) -> Void){
        var baseURL = URL(string: baseURLString)
        baseURL?.appendPathComponent("/somePath")
        
        let compusedURL = URL(string:"/somePath",relativeTo: baseURL)
        
        var componentURL = URLComponents()
        componentURL.scheme = "https"
        componentURL.host = "api.github.com"
        componentURL.path = "/gists/public"
        
        guard let validURL = componentURL.url else {
            print("URL CreaTION Failed")
            return
        }
        
        URLSession.shared.dataTask(with: validURL){  (data,response, error) in
        
                                   if let httpResponse = response as? HTTPURLResponse{
                                       print("API status:\(httpResponse.statusCode)")
                                       
                                   }
            
            guard let validData = data, error == nil else {
                print("API Error:\(error!.localizedDescription)")
                completion(.failure(error!))
                return
            }
            
            do{
                //let json = try JSONSerialization.jsonObject(with: validData,options: [])
                let gists = try JSONDecoder().decode([Gist].self, from: validData)
                
                print(gists)
                completion(.success(gists))
            } catch let serializationError{
                print(serializationError.localizedDescription)
                completion(.failure(serializationError))
            }
        }.resume()
                
        
        print(baseURL!)
        print(compusedURL?.absoluteURL ?? "Relative URL Failed....")
        
    }
}
