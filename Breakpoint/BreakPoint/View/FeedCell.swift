//
//  FeedCell.swift
//  BreakPoint
//
//  Created by Samuel Martin on 06/02/2018.
//  Copyright © 2018 Samuel Martin. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(withProfileImage image : UIImage, email: String, andContent content: String){
        self.profileImg.image = image
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
}
