//
//  Result.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(value: Value)
    case failure(error: Error)
}
