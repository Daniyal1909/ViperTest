//
//  UserDeteiledVC.swift
//  Viper test
//
//  Created by Деветов Даниял on 16/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

final class UserDetailedVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    // MARK: - public properties
    var presenter: UserDetailedViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
    }
    
}

// MARK: - UserDeteiledInput
extension UserDetailedVC: UserDetailedViewInput {
    func showLoading() {
        loadingView.isHidden = false
    }
    
    func hideLoading() {
        loadingView.isHidden = true
    }
    
    func setUserInfo(with user: UserDetails) {
        loginLabel.text = user.login
        fullNameLabel.text = user.fullName
        avatarImage.sd_setImage(with: user.avatar, completed: nil)
        // QUESTION: Нужно ли как то выносить такую логику из VC, если да то как?
        if let location = user.location {
            locationLabel.text = "Location: \(location)"
        } else {
            locationLabel.isHidden = true
        }
        if let company = user.company {
            companyLabel.text = "Company: \(company)"
        } else {
            companyLabel.isHidden = true
        }
        if let email = user.email {
            emailLabel.text = "Email: \(email)"
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
        present(alert, animated: true, completion: nil)
    }
    
}
