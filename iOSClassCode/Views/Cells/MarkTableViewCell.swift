//
//  MarkTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 08/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class MarkTableViewCell: UITableViewCell {
    static let mClass: String = String(describing: MarkTableViewCell.self)
    static let mIdentifier: String = String(describing: MarkTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 75.0
    
    
    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mMarkLabel: UILabel?
    @IBOutlet weak var mMarkDescriptionLabel: UILabel?
    
    
    override func prepareForReuse() {
        mMarkLabel?.text = ""
        mMarkDescriptionLabel?.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(data: Mark) {
        mMarkLabel?.text = String(describing: data.mark)
        mMarkDescriptionLabel?.text = data.markDescription
    }
}
