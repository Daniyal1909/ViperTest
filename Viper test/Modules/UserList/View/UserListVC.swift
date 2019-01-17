//
//  ViewController.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

class UserListVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: - public properties
    var dataSource: UserListDataSource!
    var output: ViewOutput!

    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
        output.viewIsReady()
    }
    
    func setDataSource() {
        self.dataSource.tableView = tableView
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
}

// MARK: - ViewInput
extension UserListVC: ViewInput {
    func setUsers(_ users: [User]) {
        dataSource.reloadTable(with: users)
    }
    
    func showLoading() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        tableView.isHidden = true
    }
    
    func hideLoading() {
        tableView.isHidden = false
        loadingIndicator.isHidden = true
        loadingIndicator.stopAnimating()
    }
    
    func showError(message: String) {
        tableView.isHidden = true
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}

