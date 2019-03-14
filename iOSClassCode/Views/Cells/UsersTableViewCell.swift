//
//  UsersTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 14/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class UsersTableViewCell: UITableViewCell {
    static let mClass: String = String(describing: UsersTableViewCell.self)
    static let mIdentifier: String = String(describing: UsersTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 150.0
    
    
    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mImage: UIImageView?
    @IBOutlet weak var mName: UILabel?
    @IBOutlet weak var mGender: UILabel?
    @IBOutlet weak var mAge: UILabel?
    @IBOutlet weak var mEmail: UILabel?

    
    override func prepareForReuse() {
        mImage?.image = nil
        mName?.text = ""
        mGender?.text = ""
        mAge?.text = ""
        mEmail?.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(data: UserDTO) {
        mImage?.kf.indicatorType = .activity
        mImage?.kf.setImage(
            with: URL(string: data.picture?.large ?? ""),
            //placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(RoundCornerImageProcessor(cornerRadius: mImage?.frame.size.width ?? 100 / 2)),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
        
        mName?.text = data.name?.first
        mGender?.text = data.gender
        mEmail?.text = data.email
        
        if let age = data.dob?.age?.description {
            mAge?.text = "\(String(describing: age)) years"
        }
    }
    
    private func configureCellView() {
        mView?.layer.cornerRadius = 8.0
        mView?.layer.shadowColor = UIColor.gray.cgColor
        mView?.layer.shadowOffset = CGSize.zero
        mView?.layer.shadowRadius = 8.0
        mView?.layer.shadowOpacity = 0.6
    }
}
