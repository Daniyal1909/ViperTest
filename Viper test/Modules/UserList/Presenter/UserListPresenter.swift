//
//  Presenter.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

class UserListPresenterImp {
    
    // MARK: - Public properties
    
    weak var view: ViewInput?
    var router: UserListRouterInput?
    var interactor: InteractorInput?
    
}


// MARK: - ViewOutput
extension UserListPresenterImp: ViewOutput {
    
    func viewIsReady() {
        view?.showLoading()
        interactor?.getUsers()
    }
    
}

// MARK: - InteractorOutput
extension UserListPresenterImp: InteractorOutput {
    
    func didSuccessGetUsers(with users: [User]) {
        view?.hideLoading()
        view?.setUsers(users)
    }
    
    func didFailureGetUsers(with error: Error) {
        view?.showError(message: error.localizedDescription)
    }
    
}

// MARK: - UserListDataSourceOutput
extension UserListPresenterImp: UserListDataSourceOutput {
    
    func didSelect(user: User) {
        router?.openDeteled(with: user)
    }

}
