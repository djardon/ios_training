//
//  ButtonTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 06/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    static let mClass: String = String(describing: StudentTableViewCell.self)
    static let mIdentifier: String = String(describing: StudentTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 180.0

    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mImageView: UIImageView?
    @IBOutlet weak var mNameLabel: UILabel?
    @IBOutlet weak var mSurnameLabel: UILabel?
    @IBOutlet weak var mYearLabel: UILabel?
    @IBOutlet weak var mCommentsLabel: UILabel?
    @IBOutlet weak var mMarkLabel: UILabel?
    @IBOutlet weak var mHelpButton: UIButton?

    
    override func prepareForReuse() {
        mImageView?.image = nil
        mNameLabel?.text = ""
        mSurnameLabel?.text = ""
        mYearLabel?.text = ""
        mCommentsLabel?.text = ""
        mMarkLabel?.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureCellView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(data: Student) {
        mImageView?.image = UIImage(named: data.photo)
        mNameLabel?.text = data.name
        mSurnameLabel?.text = data.surname
        mYearLabel?.text = data.year
        mCommentsLabel?.text = data.subjects.reduce("", { (text, subject) -> String in
            return text.isEmpty ? "\(subject.name)" : "\(text), \(subject.name)"
        })
        mMarkLabel?.text = String(describing: data.mark?.mark ?? 0)
        
        self.mImageView?.layer.cornerRadius = (self.mImageView?.frame.size.width ?? 0) / 2
    }
    
    
    private func configureCellView() {
        mView?.layer.cornerRadius = 8.0
        mView?.layer.shadowColor = UIColor.gray.cgColor
        mView?.layer.shadowOffset = CGSize.zero
        mView?.layer.shadowRadius = 8.0
        mView?.layer.shadowOpacity = 0.6
    }
}
