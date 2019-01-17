//
//  Cell.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    func setup(_ model: User) {
        loginLabel.text = model.login
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try Data(contentsOf: model.avatar)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.avatarImage.image = image
                }
            } catch {
                assertionFailure()
            }
        }
    }
    
    // MARK: - cell lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImage.image = nil
    }
}
