//
//  Assembly.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

final class UserListAssembly {
    
    static func assembleModule() -> UIViewController {
        
        guard let navVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UsersNavCont") as? UINavigationController,
            let view = navVC.topViewController as? UserListVC else {
            return UIViewController()
        }
        
        let presenter = UserListPresenter()
        
        let usersService = UsersServiceImp(networkLayer: NetworkLayerImp())
        
        let interactor = UserListInteractor(usersService: usersService)
        interactor.presenter = presenter
        
        let router = UserListRouter(transition: view)
        
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        let dataSource = UserListDataSource()
        dataSource.delegate = presenter
        view.dataSource = dataSource
        view.presenter = presenter
        
        return navVC
        
    }
    
}
