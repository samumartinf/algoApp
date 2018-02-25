//
//  CreatePostVC.swift
//  BreakPoint
//
//  Created by Samuel Martin on 29/01/2018.
//  Copyright © 2018 Samuel Martin. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController{
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendButton.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailLbl.text = Auth.auth().currentUser?.email!
        userImg.image = UIImage(named: "defaultProfileImage")
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Tell us something..."{
            sendButton.isEnabled = false
            DataService.instance.uploadPopst(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (success) in
                if success{
                    self.sendButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }else {
                    self.sendButton.isEnabled = true
                    print("There was en error!")
                }
            })
        }
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CreatePostVC: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
