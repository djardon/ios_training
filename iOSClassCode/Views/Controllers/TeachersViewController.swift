//
//  TeachersViewController.swift
//  iOSClassCode
//
//  Created by David Jardon on 08/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import RealmSwift

class TeachersViewController: UIViewController {
    // MARK: - IBOutlets -
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - Properties -
    private var mTeachers: Results<Teacher>? = nil
    
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure table view options
        configureTableView()
        
        // Init default data
        loadData()
        
        // Reload table data
        mTableView.reloadData()
    }
    
    // MARK: - Configuration -
    private func configureTableView() {
        mTableView.delegate = self
        mTableView.dataSource = self
    }
    
    // MARK: - Configuration -
    private func loadData() {
        mTeachers = SampleDataManager.shared.loadDefaultTeachers()
    }
}


extension TeachersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mTeachers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TeacherTableViewCell.mEstimatedHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeacherTableViewCell.mIdentifier,
                                                 for: indexPath) as! TeacherTableViewCell
        // Get teachers data for row
        if let teacher = mTeachers?[indexPath.row] {
            // Configure cell view with teachers data
            cell.configureCell(data: teacher)
        }
        
        return cell
    }
}
