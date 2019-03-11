//
//  MarksViewController.swift
//  iOSClassCode
//
//  Created by David Jardon on 08/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import RealmSwift

class MarksViewController: UIViewController {
    @IBOutlet weak var mTableView: UITableView!
    
    private var mMarks: Results<Mark>? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure table view options
        configureTableView()
        
        // Init default data
        loadData()
        
        // Reload table data
        mTableView.reloadData()
    }
    
    private func configureTableView() {
        mTableView.delegate = self
        mTableView.dataSource = self
    }
    
    private func loadData() {
        mMarks = SampleDataManager.shared.loadDefaultMarks()
    }
}


extension MarksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mMarks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MarkTableViewCell.mEstimatedHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarkTableViewCell.mIdentifier,
                                                 for: indexPath) as! MarkTableViewCell
        // Get student data for row
        if let mark = mMarks?[indexPath.row] {
            // Configure cell view with student data
            cell.configureCell(data: mark)
        }
        
        return cell
    }
}
