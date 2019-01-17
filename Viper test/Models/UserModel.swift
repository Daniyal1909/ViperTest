//
//  Model.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

struct User: Decodable {
    var id: Int
    var login: String
    var avatar: URL
    var url: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatar = "avatar_url"
        case url
    }
}

// QUESTION: Как правильно называть одну и ту же модель, когда для отоброжения в списке нужны одни свойства, а на детальной странице другие?
struct UserDeteiled: Decodable {
    var id: Int
    var login: String
    var avatar: URL
    var fullName: String?
    var location: String?
    var company: String?
    var email: String?
    
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

// QUESTION: Как правильно назвать presentation model
struct UserDeteiledPresentation {
    var id: Int
    var login: String
    var avatar: UIImage?
    var fullName: String?
    var location: String?
    var company: String?
    var email: String?
}
