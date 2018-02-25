//
//  LoginVC.swift
//  Smack
//
//  Created by Samuel Martin on 18/10/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
<<<<<<< HEAD
    
    //Outlets
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
=======

    override func viewDidLoad() {
        super.viewDidLoad()
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57

        // Do any additional setup after loading the view.
    }
   
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
<<<<<<< HEAD
    @IBAction func logginBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success{
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success{
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    func setupView() {
        spinner.isHidden = true
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PURPLE_PLACEHOLDER_COLOUR])
        passTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PURPLE_PLACEHOLDER_COLOUR])
    }
    
    
    
    
=======
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
}
