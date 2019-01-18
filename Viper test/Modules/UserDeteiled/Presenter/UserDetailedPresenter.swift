//
//  UserDeteiledPresenter.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

final class UserDetailedPresenter {
    
    // MARK: - public properties
    weak var view: UserDetailedViewInput?
    var interactor: UserDetailedInteractorInput?
    
    // MARK: - private properties
    private var userLogin: String
    
    // MARK: - init
    init(userLogin: String) {
        self.userLogin = userLogin
    }
    
    // MARK: - private methods
    private func getUserInfo() {
        view?.showLoading()
        interactor?.getUserInfo(login: userLogin)
    }
}

// MARK: - UserDetailedViewOutput
extension UserDetailedPresenter: UserDetailedViewOutput {
    
    func viewIsReady() {
        getUserInfo()
    }
    
}

// MARK: - UserDeteiledInteractorOutput
extension UserDetailedPresenter: UserDetailedInteractorOutput {
    
    func didSuccessGetUserInfo(user: UserDetails) {
        view?.hideLoading()
        view?.setUserInfo(with: user)
    }
    
    func didFailureGetUserInfo(error: Error) {
        view?.hideLoading()
        view?.showError(with: error.localizedDescription, action: {
            self.getUserInfo()
        })
    }
    
}
