//
//  Interactor.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import Foundation

class InteractorImp: InteractorInput {
    
    // MARK: - private properties
    private var usersService: UsersService!
    
    // MARK: - public properties
    weak var output: InteractorOutput?
    
    init(usersService: UsersService) {
        self.usersService = usersService
    }
    
    //MARK: - InteractorInput
    func getUsers() {
        usersService.getList { (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.output?.didSuccessGetUsers(with: value)
                case .failure(let error):
                    self.output?.didFailureGetUsers(with: error)
                }
            }
            
        }
    }
}
