//
//  NSObjectExtension.swift
//  Viper test
//
//  Created by Деветов Даниял on 18/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
