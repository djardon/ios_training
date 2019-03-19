//
//  UserTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 18/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import Kingfisher


class UserTableViewCell: UITableViewCell {
    static let mIdentifier: String = String(describing: UserTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 100.0
    
    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mImage: UIImageView?
    @IBOutlet weak var mName: UILabel?
    @IBOutlet weak var mSurname: UILabel?
    @IBOutlet weak var mGender: UILabel?
    @IBOutlet weak var mCountry: UILabel?

    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        mImage?.image = nil
        mName?.text = ""
        mSurname?.text = ""
        mGender?.text = ""
        mCountry?.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCornerAndShadow(view: mView)
    }
    
    
    // MARK: - Configure methods -
    func configureCell(data: UserDTO) {
        configure(image: data.picture?.large)
        configure(title: data.name?.title,
                  name: data.name?.first)
        configure(surname: data.name?.last)
        configure(gender: data.gender)
        configure(nation: data.nat)
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
    
    private func configure(title: String?, name firstName: String?) {
        if let titleData = title, let nameData = firstName {
            mName?.text = "\(titleData.capitalized) \(nameData.capitalized)"
        }
    }
    
    private func configure(surname: String?) {
        if let surnameData = surname {
            mSurname?.text = surnameData.capitalized
        }
    }
    
    private func configure(gender: String?) {
        if let genderData = gender {
            mGender?.text = genderData.capitalized
        }
    }
    
    private func configure(nation: String?) {
        if let nationData = nation {
            mCountry?.text = nationData.capitalized
        }
    }
}
