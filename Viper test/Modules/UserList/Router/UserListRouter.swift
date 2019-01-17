//
//  UsersListRouter.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

class UserListRouter {
    
    // MARK: - private properties
    
    private weak var transition: UIViewController?
    
    init(transition: UIViewController) {
        self.transition = transition
    }
    
}

// MARK: - UserListRouterInput
extension UserListRouter: UserListRouterInput {
    
    func openDeteled(with user: User) {
        let vc = AssembleUserDeteiled.assemble(userURL: user.url)
        transition?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
