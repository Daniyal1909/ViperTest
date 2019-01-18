//
//  UserDeteiledInteractorOutput.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

protocol UserDetailedInteractorOutput: class {
    func didSuccessGetUserInfo(user: UserDetails)
    func didFailureGetUserInfo(error: Error)
}
