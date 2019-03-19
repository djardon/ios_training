//
//  MarkTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 08/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class MarkTableViewCell: UITableViewCell {
    static let mIdentifier: String = String(describing: MarkTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 75.0
    
    
    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mMarkLabel: UILabel?
    @IBOutlet weak var mMarkDescriptionLabel: UILabel?
    
    
    // MARK: - Lifecycle -
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
    
    
    // MARK: - Configure methods -
    func configureCell(data: Mark) {
        configure(mark: String(describing: data.mark))
        configure(description: data.markDescription)
    }
    
    
    // MARK: - Private methods -
    private func configure(mark: String?) {
        mMarkLabel?.text = mark
    }
    
    private func configure(description: String?) {
        mMarkDescriptionLabel?.text = description
    }
}
