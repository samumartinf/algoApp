//
//  ShadowView.swift
//  BreakPoint
//
//  Created by Samuel Martin on 14/01/2018.
//  Copyright © 2018 Samuel Martin. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    func setupView(){
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
    }
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }

}
