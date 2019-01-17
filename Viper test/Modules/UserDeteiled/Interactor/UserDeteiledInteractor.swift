//
//  UserDeteiledInteractor.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

class UserDeteiledInteractor: UserDeteiledInteractorInput {
    
    // MARK: - private properties
    private var usersService: UsersService?
    private weak var output: UserDeteiledInteractorOutput?
    
    // MARK: - init
    init(output: UserDeteiledInteractorOutput, usersService: UsersService) {
        self.output = output
        self.usersService = usersService
    }
    
    // MARK: - UserDeteiledInteractorInput
    // QUESTION: Как в данном случае правильно перевести в main поток все кейсы? Обернуть весь switch и метать внутри между потоками или при каждый output action
    func getUserInfo(url: URL) {
        usersService?.getDeteiled(url: url, completion: { (result) in
            switch result {
            case .success(let value):
                DispatchQueue.global(qos: .background).async {
                    do {
                        let data = try Data(contentsOf: value.avatar)
                        let image = UIImage(data: data)
                        let presentationModel = UserDeteiledPresentation(id: value.id,
                                                                         login: value.login,
                                                                         avatar: image,
                                                                         fullName: value.fullName,
                                                                         location: value.location,
                                                                         company: value.company,
                                                                         email: value.email)
                        DispatchQueue.main.async {
                            self.output?.didSuccessGetUserInfo(user: presentationModel)
                        }
                    } catch {
                        self.output?.didFailureGetUserInfo(error: error)
                    }
                }
            case .failure(let error):
                self.output?.didFailureGetUserInfo(error: error)
            }
        })
    }
    
}
