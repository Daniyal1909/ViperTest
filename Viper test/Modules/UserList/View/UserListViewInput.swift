//
//  UserListViewInput.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

protocol ViewInput: AnyObject {
    func setUsers(_ users: [User])
    func showLoading()
    func hideLoading()
    func showError(message: String)
}
