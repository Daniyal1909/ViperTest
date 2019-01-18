//
//  Interactor.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

final class UserListInteractor: UserListInteractorInput {
    
    // MARK: - public properties
    weak var presenter: UserListInteractorOutput?
    
    // MARK: - private properties
    private let usersService: UsersService!
    
    init(usersService: UsersService) {
        self.usersService = usersService
    }
    
    //MARK: - UserListInteractorInput
    func getUsers() {
        usersService.getList { [weak self] (result) in
            
            guard let `self` = self else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                switch result {
                case .success(let users):
                    self.presenter?.didSuccessGetUsers(with: users)
                case .failure(let error):
                    self.presenter?.didFailureGetUsers(with: error)
                }
            }
            
        }
    }
}
