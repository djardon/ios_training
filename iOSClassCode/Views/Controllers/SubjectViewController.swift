//
//  SubjectViewController.swift
//  iOSClassCode
//
//  Created by David Jardon on 08/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import RealmSwift

class SubjectViewController: UIViewController {
    // MARK: - IBOutlets -
    @IBOutlet weak var mTableView: UITableView!
    
    // MARK: - Properties -
    private var mSubjects: Results<Subject>? = nil
    
    
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
    
    private func loadData() {
        mSubjects = SampleDataManager.shared.loadDefaultSubjects()
    }
}


extension SubjectViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mSubjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SubjectTableViewCell.mEstimatedHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubjectTableViewCell.mIdentifier,
                                                 for: indexPath) as! SubjectTableViewCell
        // Get student data for row
        if let subject = mSubjects?[indexPath.row] {
            // Configure cell view with student data
            cell.configureCell(data: subject)
        }
        
        return cell
    }
}
