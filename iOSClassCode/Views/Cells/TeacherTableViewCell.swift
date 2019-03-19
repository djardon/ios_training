//
//  SubjectTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 08/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import RealmSwift

class TeacherTableViewCell: UITableViewCell {
    static let mIdentifier: String = String(describing: TeacherTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 150.0

    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mImageView: UIImageView?
    @IBOutlet weak var mNameLabel: UILabel?
    @IBOutlet weak var mSurnameLabel: UILabel?
    @IBOutlet weak var mYearLabel: UILabel?
    @IBOutlet weak var mCommentsLabel: UILabel?
    @IBOutlet weak var mSubjectsLabel: UILabel?
    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        mImageView?.image = nil
        mNameLabel?.text = ""
        mSurnameLabel?.text = ""
        mYearLabel?.text = ""
        mCommentsLabel?.text = ""
        mSubjectsLabel?.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureCornerAndShadow(view: mView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - Configure methods -
    func configureCell(data: Teacher) {
        configure(image: data.photo)
        configure(name: data.name)
        configure(surname: data.surname)
        configure(year: data.year)
        configure(comment: data.comment)
        configure(subjects: data.subjects)
    }
    
    
    // MARK: - Private methods -
    private func configure(image: String?) {
        guard let photo = image else {
            return
        }
        
        mImageView?.image = UIImage(named: photo)
        mImageView?.layer.cornerRadius = (self.mImageView?.frame.size.width ?? 0) / 2
    }
    
    private func configure(name: String?) {
        mNameLabel?.text = name
    }
    
    private func configure(surname: String?) {
        mSurnameLabel?.text = surname
    }
    
    private func configure(year: String?) {
        mYearLabel?.text = year
    }
    
    private func configure(comment: String?) {
        mCommentsLabel?.text = comment
    }
    
    private func configure(subjects: List<Subject>?) {
        guard let subjectsData = subjects else {
            return
        }
        
        mSubjectsLabel?.text = subjectsData.reduce("", { (text, subject) -> String in
            return text.isEmpty ? "\(subject.name)" : "\(text), \(subject.name)"
        })
    }
}
