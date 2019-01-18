//
//  Api.swift
//  Viper test
//
//  Created by Деветов Даниял on 18/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

enum Api {
    case userList
    case deteils(login: String)
}

extension Api {
    private var baseURL: String {
        return "https://api.github.com/"
    }
    
    var path: URL? {
        switch self {
        case .userList: return URL(string: "\(baseURL)users")
        case .deteils(let login): return URL(string: "\(baseURL)users/\(login)")
        }
    }
    
    var method: String {
        switch self {
        case .userList, .deteils: return "GET"
        }
    }
}
