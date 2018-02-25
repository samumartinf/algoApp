//
//  LoginViewController.swift
//  BreakPoint
//
//  Created by Samuel Martin on 14/01/2018.
//  Copyright © 2018 Samuel Martin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: InsetTextField!
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        emailTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func signInPressed(_ sender: Any) {
        if emailTextField.text != nil && passwordTextField.text != nil{
            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text! , loginComplete: { (success, loginError) in
                self.errorLabel.isHidden = true
                if success{
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let meVC = storyboard.instantiateViewController(withIdentifier: "TabBarController")
                    self.present(meVC, animated: true, completion: nil)
                } else {
                    self.errorLabel.text = String(describing: loginError!.localizedDescription)
                    self.errorLabel.isHidden = false
                }
                
                //If user has never registered, then register
                AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text! , userCreationComplete: { (success, registerError) in
                    if success{
                        AuthService.instance.loginUser(withEmail: self.emailTextField.text! , andPassword: self.passwordTextField.text! , loginComplete: { (success, nil) in
                            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                            let meVC = storyboard.instantiateViewController(withIdentifier: "TabBarController")
                            self.present(meVC, animated: true, completion: nil)
                        })
                    } else {
                        self.errorLabel.text = String(describing: registerError!.localizedDescription)
                        self.errorLabel.isHidden = false
                    }
                })
            })
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate{
}
