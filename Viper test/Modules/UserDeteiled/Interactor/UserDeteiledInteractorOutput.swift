//
//  UserDeteiledInteractorOutput.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

protocol UserDeteiledInteractorOutput: class {
    func didSuccessGetUserInfo(user: UserDeteiledPresentation)
    func didFailureGetUserInfo(error: Error)
}
