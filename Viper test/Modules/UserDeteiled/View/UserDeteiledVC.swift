//
//  UserDeteiledVC.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

class UserDeteiledVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    // MARK: - public properties
    var output: UserDeteiledViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
}

// MARK: - UserDeteiledInput
extension UserDeteiledVC: UserDeteiledViewInput {
    func showLoading() {
        loadingView.isHidden = false
    }
    
    func hideLoading() {
        loadingView.isHidden = true
    }
    
    func setUserInfo(with user: UserDeteiledPresentation) {
        loginLabel.text = user.login
        fullNameLabel.text = user.fullName
        avatarImage.image = user.avatar
        // QUESTION: Нужно ли как то выносить такую логику из VC, если да то как?
        if user.location != nil {
            locationLabel.text = "Location: \(user.location ?? "")"
        } else {
            locationLabel.isHidden = true
        }
        if user.company != nil {
            companyLabel.text = "Company: \(user.company ?? "")"
        } else {
            companyLabel.isHidden = true
        }
        if user.email != nil {
            emailLabel.text = "Email: \(user.email ?? "")"
        } else {
            emailLabel.isHidden = true
        }
    }
    
    func showError(with message: String, action: (() -> Void)?) {
        let alert = UIAlertController(title: "Внимание", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Повторить попытку", style: .destructive, handler: { (_) in
            action?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
