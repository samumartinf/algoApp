//
//  UIView.swift
//  GoalpostApp
//
//  Created by Samuel Martin on 13/01/2018.
//  Copyright © 2018 Samuel Martin. All rights reserved.
//

import UIKit

extension UIView{
    func bindToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification){
        let duration =  notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startFrame = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaFrame = endFrame.origin.y - startFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaFrame
        }, completion: nil)
    }
}
