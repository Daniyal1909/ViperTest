//
//  Presenter.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

final class UserListPresenter {
    
    // MARK: - Public properties
    weak var view: UserListViewInput?
    var router: UserListRouterInput?
    var interactor: UserListInteractorInput?
    
}


// MARK: - UserListViewOutput
extension UserListPresenter: UserListViewOutput {
    
    func viewIsReady() {
        view?.showLoading()
        interactor?.getUsers()
    }
    
}

// MARK: - UserListInteractorOutput
extension UserListPresenter: UserListInteractorOutput {
    
    func didSuccessGetUsers(with users: [User]) {
        view?.hideLoading()
        view?.setUsers(users)
    }
    
    func didFailureGetUsers(with error: Error) {
        view?.showError(message: error.localizedDescription)
    }
    
}

// MARK: - UserListDataSourceOutput
extension UserListPresenter: UserListDataSourceOutput {
    
    func didSelect(user: User) {
        router?.openDeteled(with: user)
    }

}
