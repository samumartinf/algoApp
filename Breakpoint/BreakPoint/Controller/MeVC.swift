//
//  MeVC.swift
//  BreakPoint
//
//  Created by Samuel Martin on 20/01/2018.
//  Copyright © 2018 Samuel Martin. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailLabel.text = Auth.auth().currentUser?.email!
    }

    @IBAction func logOutPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout", message: "Do you really want to log out?", preferredStyle: .actionSheet)
        let logoutCancel = UIAlertAction(title: "Cancel", style: .cancel) { (buttonTapped) in
            self.dismiss(animated: true, completion: nil)
        }
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { (buttonTapped) in
            do{
               try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthViewController
                self.present(authVC!, animated: true, completion: nil)
            } catch{
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(logoutCancel)
        present(logoutPopup, animated: true, completion: nil)
    }
    
}
