//
//  DataSource.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

class UserListDataSource: NSObject {
    
    // MARK: - private propeties
    private var items: [User] = []
    
    // MARK: - public properties
    weak var tableView: UITableView?
    weak var delegate: UserListDataSourceOutput?
    
    func reloadTable(with items: [User]) {
        self.items = items
        tableView?.reloadData()
    }
    
}

// MARK: - UITableViewDataSource
extension UserListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserCell else { return UITableViewCell() }
        cell.setup(items[indexPath.row])
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension UserListDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(user: items[indexPath.row])
    }
    
}
