//
//  UserDeteiledInput.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

protocol UserDeteiledViewInput: class {
    func showLoading()
    func hideLoading()
    func setUserInfo(with user: UserDeteiledPresentation)
    func showError(with message: String, action: (() -> Void)?)
}
