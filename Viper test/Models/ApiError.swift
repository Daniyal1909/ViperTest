//
//  ApiError.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case badRequest
    case parsing
}

extension ApiError {
    var localizedDescription: String {
        switch self {
        case .badRequest: return "Bad request"
        case .parsing: return "Упс, плохой программист"
        }
    }
}
