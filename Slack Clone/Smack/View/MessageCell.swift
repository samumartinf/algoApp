//
//  MessageCellTableViewCell.swift
//  Smack
//
//  Created by Samuel Martin on 04/11/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    //Outlets 
    @IBOutlet weak var userImg: RoundedImage!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    func configureCell(message: Message){
        messageBodyLbl.text = message.messageBody
        usernameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.retunrUIColour(components: message.userAvatarColor)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
