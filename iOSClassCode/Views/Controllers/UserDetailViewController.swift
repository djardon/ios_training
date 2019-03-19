//
//  UserDetailViewController.swift
//  iOSClassCode
//
//  Created by David Jardon on 14/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

enum UserDetailCellType {
    case user
    case data
    case map
}

class UserDetailViewController: UIViewController {
    // MARK: - IBOutlets -
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - Properties -
    var mUserData: UserDTO? = nil
    
    // Data list with cells type
    private let mCellsTypes = [UserDetailCellType.user,
                               UserDetailCellType.data,
                               UserDetailCellType.map]
    
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        self.title = mUserData?.name?.first
    }
    
    // MARK: - Configuration -
    private func configureTableView() {
        mTableView.delegate = self
        mTableView.dataSource = self
    }
}


// MARK: - Extension TableView -
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mCellsTypes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight = CGFloat.leastNonzeroMagnitude
        // Get cell type for row and return cell height
        switch mCellsTypes[indexPath.row] {
            case .user:
                cellHeight = UserTableViewCell.mEstimatedHeight

            case .data:
                cellHeight = UserDataTableViewCell.mEstimatedHeight

            case .map:
                cellHeight = UserMapTableViewCell.mEstimatedHeight
        }
        
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get cell type for row and return cell configured
        switch mCellsTypes[indexPath.row] {
            case .user:
                return cellUser(tableView: tableView, indexPath:indexPath)
            
            case .data:
                return cellData(tableView: tableView, indexPath:indexPath)

            case .map:
                return cellMap(tableView: tableView, indexPath:indexPath)
        }
    }
    
    // Get cell for User
    private func cellUser(tableView: UITableView, indexPath: IndexPath) -> UserTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.mIdentifier,
        for: indexPath) as! UserTableViewCell
        
        // Configure cell view with user data
        if let user = mUserData {
            cell.configureCell(data: user)
        }
        
        return cell
    }
    
    // Get cell for data
    private func cellData(tableView: UITableView, indexPath: IndexPath) -> UserDataTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserDataTableViewCell.mIdentifier,
                                                 for: indexPath) as! UserDataTableViewCell
        // Configure cell view with user data
        if let user = mUserData {
            cell.configureCell(data: user)
        }
        
        return cell
    }
    
    // Get cell for map
    private func cellMap(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserMapTableViewCell.mIdentifier,
                                                 for: indexPath) as! UserMapTableViewCell
        // Configure cell view with user data
        if let user = mUserData {
            cell.configureCell(data: user)
        }
        
        return cell
    }
}
