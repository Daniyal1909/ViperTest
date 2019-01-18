//
//  UserListInteractorOutput.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

protocol UserListInteractorOutput: class {
    func didSuccessGetUsers(with users: [User])
    func didFailureGetUsers(with error: Error)
}
