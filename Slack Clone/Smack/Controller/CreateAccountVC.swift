//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Samuel Martin on 20/10/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    
    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
<<<<<<< HEAD
    @IBOutlet weak var spinner: UIActivityIndicatorView!
=======
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColour = "[0.5, 0.5, 0.5, 1]"
<<<<<<< HEAD
    var bgColour: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != ""{
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColour == nil{
                userImage.backgroundColor = UIColor.darkGray
            }
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any){
        
        guard let name = usernameTxt.text, usernameTxt.text != "" else {print("Username is empty"); return}
        guard let email = emailTxt.text , emailTxt.text != "" else{print("Enter an email"); return}
        guard let password = passTxt.text , passTxt.text != "" else{print("Enter a password"); return}
    
        spinner.isHidden = false
        spinner.startAnimating()
=======
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if UserDataService.instance.avatarName != ""{
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else {print("Username is empty"); return}
        guard let email = emailTxt.text , emailTxt.text != "" else{print("Enter an email"); return}
        guard let password = passTxt.text , passTxt.text != "" else{print("Enter a password"); return}
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success{
                AuthService.instance.loginUser(email: email, password: password, completionHandler: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColour: self.avatarColour, completion: { (success) in
                            if success{
<<<<<<< HEAD
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil) 
=======
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func genBgColourPressed(_ sender: Any) {
<<<<<<< HEAD
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColour = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColour = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.2) {
            self.userImage.backgroundColor = self.bgColour
        }
=======
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
<<<<<<< HEAD
    func setupView() {
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER_COLOUR])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER_COLOUR])
        passTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER_COLOUR])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
=======
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
}
