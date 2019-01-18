//
//  NetworkLayerImp.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

// MARK: - NetworkLayer
final class NetworkLayerImp: NetworkLayer {
    
    func request<T>(api: Api, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        guard let url = api.path else {
            completion(.failure(error: ApiError.badRequest))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = api.method
        let task = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error: error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(error: ApiError.badRequest))
                return
            }
            
            
            if let data = data {
                if response.statusCode == 200 {
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(model: result))
                    } catch {
                        completion(.failure(error: ApiError.parsing))
                    }
                } else {
                    completion(.failure(error: ApiError.badRequest))
                }
            } else {
                completion(.failure(error: ApiError.badRequest))
            }
        }
        task.resume()
    }
    
}
