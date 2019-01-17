//
//  Entity.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

// MARK: - UsersService
// QUESTION: Нужно ли здесь маркировать наследование по протоколу
class UsersServiceImp: UsersService {
    
    // MARK: - private properties
    // QUESTION: нужно прописывать зависимость в Assembly?
    private let networkLayer: NetworkLayer = NetworkLayerImp()
    
    func getList(completion: @escaping (Result<[User]>) -> Void) {
        networkLayer.request(url: URL(string: "https://api.github.com/users")!, completion: completion)
    }
    
    func getDeteiled(url: URL,completion: @escaping (Result<UserDeteiled>) -> Void) {
        networkLayer.request(url: url, completion: completion)
    }
}
