//
//  Cell.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit
import SDWebImage

final class UserCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // MARK: - Methods
    func setup(_ model: User) {
        loginLabel.text = model.login
        avatarImageView.sd_setImage(with: model.avatar, completed: nil)
    }
    
    // MARK: - cell lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
    }
}
