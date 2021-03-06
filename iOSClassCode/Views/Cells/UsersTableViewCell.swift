//
//  UsersTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 14/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import Kingfisher

class UsersTableViewCell: UITableViewCell {
    static let mIdentifier: String = String(describing: UsersTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 150.0
    
    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mImage: UIImageView?
    @IBOutlet weak var mName: UILabel?
    @IBOutlet weak var mGender: UILabel?
    @IBOutlet weak var mAge: UILabel?
    @IBOutlet weak var mEmail: UILabel?

    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        mImage?.image = nil
        mName?.text = ""
        mGender?.text = ""
        mAge?.text = ""
        mEmail?.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCornerAndShadow(view: mView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    // MARK: - Configure methods -
    func configureCell(data: UserDTO) {
        configure(image: data.picture?.large)
        configure(name: data.name?.first)
        configure(gender: data.gender)
        configure(email: data.email)
        configure(age: data.dob?.age?.description)
    }
    
    
    // MARK: - Private methods -
    private func configure(image: String?) {
        mImage?.kf.indicatorType = .activity
        mImage?.kf.setImage(
            with: URL(string: image ?? ""),
            //placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(RoundCornerImageProcessor(cornerRadius: mImage?.frame.size.width ?? 100 / 2)),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
    private func configure(name firstName: String?) {
        if let nameData = firstName {
            mName?.text = nameData.capitalized
        }
    }
    
    private func configure(gender: String?) {
        if let genderData = gender {
            mGender?.text = genderData.capitalized
        }
    }
    
    private func configure(email: String?) {
        if let emailData = email {
            mEmail?.text = "\(emailData)"
        }
    }
    
    private func configure(age: String?) {
        if let ageData = age {
            mAge?.text = "age: \(String(describing: ageData))"
        }
    }
}
