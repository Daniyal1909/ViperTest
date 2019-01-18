//
//  Result.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

enum Result<Model> {
    case success(model: Model)
    case failure(error: Error)
}
