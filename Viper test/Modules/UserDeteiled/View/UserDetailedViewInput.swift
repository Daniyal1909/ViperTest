//
//  UserDeteiledInput.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

protocol UserDetailedViewInput: class {
    func showLoading()
    func hideLoading()
    func setUserInfo(with user: UserDetails)
    func showError(with message: String, action: (() -> Void)?)
}
