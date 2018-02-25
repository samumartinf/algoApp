//
//  TableViewCell.swift
//  BreakPoint
//
//  Created by Samuel Martin on 24/02/2018.
//  Copyright © 2018 Samuel Martin. All rights reserved.
//

import UIKit

class userCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var checkImg: UIImageView!
    
    var showing = false
    
    func configureCell(withImage image: UIImage, email: String, isSelected: Bool){
        self.profileImage.image = image
        self.userLbl.text = email
        self.checkImg.isHidden = true
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            showing = !showing
        }
        if showing{
            checkImg.isHidden = false
        } else {
            checkImg.isHidden = true
        }
    }
    
    

}
