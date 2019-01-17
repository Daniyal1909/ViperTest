//
//  AssembleUserDeteiled.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

final class AssembleUserDeteiled {
    static func assemble(userURL: URL) -> UIViewController {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDeteiledVC") as? UserDeteiledVC else {
            return UIViewController()
        }
        
        let presenter = UserDeteiledPresenter()
        let usersService = UsersServiceImp()
        let interactor = UserDeteiledInteractor(output: presenter, usersService: usersService)
        presenter.interactor = interactor
        presenter.view = vc
        presenter.userURL = userURL
        
        vc.output = presenter
        return vc
    }
}
