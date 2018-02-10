//
//  RoundedImage.swift
//  Smack
//
//  Created by Samuel Martin on 28/10/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImage: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }

}
