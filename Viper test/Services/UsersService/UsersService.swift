//
//  UsersService.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

protocol UsersService {
    func getList(completion: @escaping (Result<[User]>) -> Void)
    func getDeteiled(url: URL,completion: @escaping (Result<UserDeteiled>) -> Void)
}
