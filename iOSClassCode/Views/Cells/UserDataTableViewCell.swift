//
//  UserDataTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 18/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class UserDataTableViewCell: UITableViewCell {
    // MARK: - Class -
    static let mIdentifier: String = String(describing: UserDataTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 190.0
    
    // MARK: - IBOutlets -
    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mEmail: UILabel?
    @IBOutlet weak var mPhone: UILabel?
    @IBOutlet weak var mBirthdate: UILabel?
    @IBOutlet weak var mAge: UILabel?
    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        mEmail?.text = ""
        mPhone?.text = ""
        mAge?.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCornerAndShadow(view: mView)
    }
    
    
    // MARK: - Configure methods -
    func configureCell(data: UserDTO) {
        configure(email: data.email)
        configure(phone: data.phone)
        configure(dob: data.dob?.date)
        configure(age: data.dob?.age?.description)
    }
    
    
    // MARK: - Private methods -
    private func configure(email: String?) {
        if let emailData = email {
            mEmail?.text = "\(emailData)"
        }
    }
    
    private func configure(phone: String?) {
        if let phoneData = phone {
            mPhone?.text = "phone: \(phoneData)"
        }
    }
    
    private func configure(dob: Date?) {
        if let birthDate = dob {
            // Date format 1945-01-10 11:56:18 +0000
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateStyle = DateFormatter.Style.long
            
            mBirthdate?.text = "birthdate: \(dateFormatterPrint.string(from: birthDate))"
        }
    }
    
    private func configure(age: String?) {
        if let ageData = age {
            mAge?.text = "age: \(String(describing: ageData))"
        }
    }
}
