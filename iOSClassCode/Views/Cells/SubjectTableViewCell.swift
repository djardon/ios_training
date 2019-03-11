//
//  CustomTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 06/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    static let mClass: String = String(describing: SubjectTableViewCell.self)
    static let mIdentifier: String = String(describing: SubjectTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 180.0

    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mImageView: UIImageView?
    @IBOutlet weak var mTitleLabel: UILabel?
    @IBOutlet weak var mSubtitleLabel: UILabel?
    @IBOutlet weak var mDescriptionLabel: UILabel?

    
    override func prepareForReuse() {
        mImageView?.image = nil
        mTitleLabel?.text = ""
        mSubtitleLabel?.text = ""
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
    
    func configureCell(data: Subject) {
        mImageView?.image = UIImage(named: data.image)
        mTitleLabel?.text = data.name
        mSubtitleLabel?.text = data.year
        mDescriptionLabel?.text = data.comment
        
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
