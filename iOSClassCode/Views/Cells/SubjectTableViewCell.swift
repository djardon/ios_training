//
//  CustomTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 06/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    static let mIdentifier: String = String(describing: SubjectTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 180.0

    
    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mImageView: UIImageView?
    @IBOutlet weak var mTitleLabel: UILabel?
    @IBOutlet weak var mSubtitleLabel: UILabel?
    @IBOutlet weak var mDescriptionLabel: UILabel?

    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        mImageView?.image = nil
        mTitleLabel?.text = ""
        mSubtitleLabel?.text = ""
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
    func configureCell(data: Subject) {
        configure(image: data.image)
        configure(name: data.name)
        configure(year: data.year)
        configure(description: data.comment)
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
        mTitleLabel?.text = name
    }
    
    private func configure(year: String?) {
        mSubtitleLabel?.text = year
    }
    
    private func configure(description: String?) {
        mDescriptionLabel?.text = description
    }
}
