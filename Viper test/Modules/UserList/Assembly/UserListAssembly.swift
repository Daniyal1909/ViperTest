//
//  Assembly.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

class UserListAssembly {
    static func assembleModule() -> UIViewController {
        guard let navVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UsersNavCont") as? UINavigationController,
            let vc = navVC.topViewController as? UserListVC else {
            return UIViewController()
        }
        
        let presenter = UserListPresenterImp()
        
        let usersService = UsersServiceImp()
        
        let interactor = InteractorImp(usersService: usersService)
        interactor.output = presenter
        
        let router = UserListRouter(transition: vc)
        
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = vc
        
        let dataSource = UserListDataSource()
        dataSource.delegate = presenter
        vc.dataSource = dataSource
        vc.output = presenter
        
        return navVC
    }
}
