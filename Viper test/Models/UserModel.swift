//
//  Model.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

struct User: Decodable {
    let id: Int
    let login: String
    let avatar: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatar = "avatar_url"
    }
}

struct UserDetails: Decodable {
    let id: Int
    let login: String
    let avatar: URL
    let fullName: String?
    let location: String?
    let company: String?
    let email: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case fullName = "name"
        case location
        case company
        case email
        case avatar = "avatar_url"
    }
}
