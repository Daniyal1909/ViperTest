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
    
    func request<T>(url: URL, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        let task = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completion(Result.failure(error: error!))
                return
            }
            if let data = `data` {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(Result.success(value: result))
                } catch {
                    completion(Result.failure(error: ApiError.badRequest))
                }
            } else {
                completion(Result.failure(error: ApiError.badRequest))
            }
        }
        task.resume()
    }
    
}
