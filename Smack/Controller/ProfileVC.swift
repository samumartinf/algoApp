//
//  ProfileVC.swift
//  Smack
//
//  Created by Samuel Martin on 29/10/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        // Do any additional setup after loading the view.
    }
    
    //Actions
    @IBAction func logOutPressed(_ sender: Any) {
        UserDataService.instance.logOutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    func setupView() {
        userLbl.text = UserDataService.instance.name
        emailLbl.text = UserDataService.instance.email
        avatarImg.image = UIImage(named: UserDataService.instance.avatarName)
        avatarImg.backgroundColor = UserDataService.instance.retunrUIColour(components: UserDataService.instance.avatarColour)
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.touchHandler(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func touchHandler(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: false, completion: nil)
    }
}
