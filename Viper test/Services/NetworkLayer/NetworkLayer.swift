//
//  NetworkLayer.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

protocol NetworkLayer {
    func request<T: Decodable>(api: Api, completion: @escaping (Result<T>) -> Void)
}
