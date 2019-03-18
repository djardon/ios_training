//
//  UsersViewController.swift
//  iOSClassCode
//
//  Created by David Jardon on 13/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import Lottie


class UsersViewController: UIViewController {
    // MARK: - IBOutlets -
    @IBOutlet weak var mViewLoading: UIView!
    @IBOutlet weak var mTableView: UITableView!

    // MARK: - Properties -
    private var mUsersData: Array<UserDTO> = Array()
    // Lottie animation
    private let animationView = AnimationView(name: "loading_animation")
    
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure laoding animation view
        configureLoading()
        
        // Configure table view options and
        // load data from service
        configureTableView()
        loadServiceData()
    }

    // MARK: - Configuration -
    private func configureTableView() {
        mTableView.delegate = self
        mTableView.dataSource = self
    }
    
    private func configureLoading() {
        // Configure lottie animation with
        // infinite loops
        animationView.loopMode = .loop
        // Set lottie animation view size with
        // container view frame
        animationView.frame = self.mViewLoading.frame
        // Add lottie animation view to container
        // view as a subview
        self.mViewLoading.addSubview(animationView)
    }
    
    
    // MARK: - Show methods -
    private func showLoading(show: Bool) {
        // Show loading if animation is not playing
        // and show container view
        if (show && !animationView.isAnimationPlaying) {
            mViewLoading.isHidden = false
            animationView.play()
        }
        else if (!show){
            // Stop loading animation
            // and hide container view
            animationView.stop()
            mViewLoading.isHidden = true
        }
    }
    
    private func showCancelAlert(title: String, message: String) {
        // Create custom alert controller with title
        // and message. Show with 'Cancel' option button
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancel",
                                      style: .cancel,
                                      handler: nil))
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    
    // MARK: - Data -
    private func loadServiceData() {
        // Show loading
        showLoading(show: true)
        
        // Call to our ApiManager to fetch users data
        // from service
        ApiManager.shared.fetchUsers(count: 500) { result in
            switch result {
                case .success(let data):
                    // Unwrap users data
                    guard let users = data as? UsersDTO,
                          let usersData = users.users else {
                        return
                    }
                
                    // First remove all data
                    self.mUsersData.removeAll()
                    // Add all new data
                    self.mUsersData.append(contentsOf: usersData)
                    // Reload table view data
                    self.mTableView.reloadData()
                    // Stop and hide loading
                    self.showLoading(show: false)

                case .failure(let message):
                    // Print and show alert with message
                    // from this error response
                    print(message ?? "Unknow error")
                    self.showCancelAlert(title: "Error",
                                         message: message ?? "Unknow error")
            }
        }
    }
}

// MARK: - Extension TableView -
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mUsersData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UsersTableViewCell.mEstimatedHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.mIdentifier,
                                                 for: indexPath) as! UsersTableViewCell
        // Get user data for row and
        // configure cell view with user data
        cell.configureCell(data: mUsersData[indexPath.row])

        return cell
    }
}
