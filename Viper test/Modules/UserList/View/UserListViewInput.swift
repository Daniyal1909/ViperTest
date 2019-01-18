//
//  UserListViewInput.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

protocol UserListViewInput: class {
    func setUsers(_ users: [User])
    func showLoading()
    func hideLoading()
    func showError(message: String)
}
