//
//  UsersListRouter.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

final class UserListRouter {
    
    // MARK: - private properties
    private weak var transition: UIViewController?
    
    // MARK: - Init
    init(transition: UIViewController) {
        self.transition = transition
    }
    
}

// MARK: - UserListRouterInput
extension UserListRouter: UserListRouterInput {
    
    func openDeteled(with user: User) {
        let model = UserDetailsAssembly.Model(userLogin: user.login)
        let vc = UserDetailsAssembly.assemble(model: model)
        transition?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
