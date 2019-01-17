//
//  UserDeteiledPresenter.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

class UserDeteiledPresenter {
    
    // MARK: - public properties
    weak var view: UserDeteiledViewInput?
    var interactor: UserDeteiledInteractorInput?
    var userURL: URL?
    
    // MARK: - private methods
    private func getUserInfo() {
        if userURL != nil {
            view?.showLoading()
            interactor?.getUserInfo(url: userURL!)
        } else {
            view?.showError(with: "Не корректный адрес пользователя", action: nil)
        }
    }
}

// MARK: - UserDeteiledViewOutput
extension UserDeteiledPresenter: UserDeteiledViewOutput {
    
    func viewIsReady() {
        getUserInfo()
    }
    
}

// MARK: - UserDeteiledInteractorOutput
extension UserDeteiledPresenter: UserDeteiledInteractorOutput {
    
    func didSuccessGetUserInfo(user: UserDeteiledPresentation) {
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
