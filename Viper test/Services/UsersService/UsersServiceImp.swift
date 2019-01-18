//
//  Entity.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

// MARK: - UsersService
final class UsersServiceImp: UsersService {
    
    // MARK: - private properties
    private let networkLayer: NetworkLayer
    
    init(networkLayer: NetworkLayer) {
        self.networkLayer = networkLayer
    }
    
    func getList(completion: @escaping (Result<[User]>) -> Void) {
        networkLayer.request(api: Api.userList, completion: completion)
    }
    
    func getDetails(login: String,completion: @escaping (Result<UserDetails>) -> Void) {
        let api = Api.deteils(login: login)
        networkLayer.request(api: api, completion: completion)
    }
}
