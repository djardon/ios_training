//
//  ExtensionTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 18/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

// Extension of TableViewCell
extension UITableViewCell {

    // Add a custom method in TableViewCell class to
    // confugure corner radius and shadow opacity
    func configureCornerAndShadow(view: UIView?, cornerRadius: CGFloat = 8.0, shadowOpacity: Float = 0.6) {
        view?.layer.cornerRadius = cornerRadius
        view?.layer.shadowColor = UIColor.gray.cgColor
        view?.layer.shadowOffset = CGSize.zero
        view?.layer.shadowRadius = cornerRadius
        view?.layer.shadowOpacity = shadowOpacity
    }
}
