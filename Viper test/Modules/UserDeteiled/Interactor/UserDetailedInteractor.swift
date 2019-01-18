//
//  UserDeteiledInteractor.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

final class UserDetailedInteractor: UserDetailedInteractorInput {
    
    weak var presenter: UserDetailedInteractorOutput?
    
    // MARK: - private properties
    private let usersService: UsersService?
    
    // MARK: - init
    init(usersService: UsersService) {
        self.usersService = usersService
    }
    
    // MARK: - UserDetailedInteractorInput
    // QUESTION: Как в данном случае правильно перевести в main поток все кейсы? Обернуть весь switch и метать внутри между потоками или при каждый output action
    func getUserInfo(login: String) {
        
        usersService?.getDetails(login: login, completion: { [weak self] (result) in
            
            guard let `self` = self else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                
                switch result {
                case .success(let user):
                    self.presenter?.didSuccessGetUserInfo(user: user)
                case .failure(let error):
                    self.presenter?.didFailureGetUserInfo(error: error)
                }
            }
            
        })
        
    }
    
}
