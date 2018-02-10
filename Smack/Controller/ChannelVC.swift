//
//  ChannelVC.swift
//  Smack
//
//  Created by Tushar Katyal on 19/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit

<<<<<<< HEAD
class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
=======
class ChannelVC: UIViewController {
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57

    
    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
<<<<<<< HEAD
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
=======
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
    


    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.channelsLoaded(_:)), name: NOTIF_CHANNELS_LOADED, object: nil)
        SocketService.instance.getChannel { (success) in
            if success{
                self.tableView.reloadData()
            }
        }

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }

    @IBAction func addChannelPressed(_ sender: Any) {
        if AuthService.instance.isLogedIn{
            let addChannel = AddChannelVC()
            addChannel.modalPresentationStyle = .custom
            present(addChannel, animated: true, completion: nil)
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLogedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
           performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    @objc func userDataDidChange(_ notif: Notification) {
        setupUserInfo()
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLogedIn{
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.retunrUIColour(components: UserDataService.instance.avatarColour)
            tableView.reloadData()
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        } else {
            print("error while retrieveing cell information")
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    @objc func channelsLoaded(_ notif: Notification) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = MessageService.instance.channels[indexPath.row]
        MessageService.instance.selectedChannel = channel
        NotificationCenter.default.post(name: NOTIF_CHANNEL_SELECTED, object: nil)
        self.revealViewController().revealToggle(animated: true)
    }
=======

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57

}
