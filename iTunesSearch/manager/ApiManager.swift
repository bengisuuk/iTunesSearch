//
//  ApiManager.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 12.12.2022.
//

import Foundation
import UIKit

typealias Parameters = [String:String]

class ApiManager: NSObject {
    
    static let shared = ApiManager()
    
    func getBaseUrl(endpoint: Endpoint,appendedParameter: String? = nil) -> URL? {
        return URL(string: Credentials.baseURL + endpoint.rawValue + ((appendedParameter != nil) ? "/\(appendedParameter!)" : ""))
    }
    
    public func getRequest<T>(type: T.Type, endpoint: Endpoint,parameters: Parameters, isJson: Bool? = true, completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable {
        guard var url = self.getBaseUrl(endpoint: endpoint) else {return }
        parameters.forEach { (arg0) in
            let (key, value) = arg0
            url = url.appending(key, value: value)
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let httpResponse = response as? HTTPURLResponse
            DispatchQueue.main.async {
                self.handleDataResponse(data: data, response: httpResponse, error: error, isJson: isJson, completion: completion)
            }
        }
        task.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, isJson: Bool? = true, completion: (NetworkResponse<T>) -> ()) {
        if let data = data ,let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
            debugPrint("URL: ", response?.url ?? "")
            print("Response \n\(json)")
        }
        guard error == nil else {
            debugPrint(error)
            return completion(.failure(.customError))
        }
        guard let response = response else { return completion(.failure(.customError)) }
        
        switch response.statusCode {
        case 200...299:
            guard let data = data else { return completion(.failure(.customError))}
            do {
                if isJson == true {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                }
                else {
                    if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? T {
                        completion(.success(json))
                    }
                    
                }
            } catch  {
                do{
                    let errorModel = try JSONDecoder().decode(ErrorModel.self, from: data)
                    completion(.error(errorModel))
                    print(error)
                    return
                }
                catch{
                    completion(.failure(.customError))
                    print(error.localizedDescription)
                }
             
            }
        case 400:
            guard let data = data else { return completion(.failure(.customError))}
            guard let errorModel = try? JSONDecoder().decode(ErrorResponseModel.self, from: data) else {
                completion(.failure(.customError))
                return
            }
            completion(.error(errorModel.error ?? ErrorModel(code: "", message: "", desc: "", errorId: 0, status: 0)))
       // case 403:
          //  AppSession.shared.logoutUser()
         //   completion(.failure(.invalidToken))
        default:
            completion(.failure(.customError))
        }
    }
}

extension URL {
    func appending(_ queryItem: String, value: String?) -> URL {
        
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        
        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        
        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)
        
        // Append the new query item in the existing query items array
        queryItems.append(queryItem)
        
        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems
        
        // Returns the url from new url components
        return urlComponents.url!
    }
}
