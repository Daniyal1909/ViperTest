//
//  AssembleUserDeteiled.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

final class UserDetailsAssembly {
    
    static func assemble(model: Model) -> UIViewController {
        
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailedVC") as? UserDetailedVC else {
            return UIViewController()
        }
        
        let presenter = UserDetailedPresenter(userLogin: model.userLogin)
        let usersService = UsersServiceImp(networkLayer: NetworkLayerImp())
        let interactor = UserDetailedInteractor(usersService: usersService)
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter = presenter
        return view
        
    }
    
}

extension UserDetailsAssembly {
    struct Model {
        var userLogin: String
    }
}
