//
//  StudentsViewController.swift
//  iOSClassCode
//
//  Created by David Jardon on 06/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import RealmSwift

class StudentsViewController: UIViewController {
    // MARK: - IBOutlets -
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - Properties -
    private var mStudents: Results<Student>? = nil
    
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure table view options
        configureTableView()
        
        // Init default data
        initData()
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
    private func initData() {
        SampleDataManager.shared.initDefaultData()
    }
    
    private func loadData() {
        mStudents = SampleDataManager.shared.loadDefaultStudents()
    }
}


extension StudentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mStudents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return StudentTableViewCell.mEstimatedHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.mIdentifier,
                                                 for: indexPath) as! StudentTableViewCell
        // Get student data for row
        if let student = mStudents?[indexPath.row] {
            // Configure cell view with student data
            cell.configureCell(data: student)
        }
        
        return cell
    }
}
