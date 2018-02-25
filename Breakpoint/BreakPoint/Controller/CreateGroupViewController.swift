//
//  CreateGroupViewController.swift
//  BreakPoint
//
//  Created by Samuel Martin on 24/02/2018.
//  Copyright © 2018 Samuel Martin. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var peopleTableView: UITableView!
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleTableView.dataSource = self
        peopleTableView.delegate = self
        peopleTextField.delegate = self
        peopleTextField.addTarget(self, action: #selector(textfielddidChange), for: .editingChanged)
        
    }
    
    @IBAction func donePressed(_ sender: Any) {
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func textfielddidChange(){
        if peopleTextField.text == ""{
            emailArray = []
            peopleTableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: peopleTextField.text!, handler: { (returnedArray) in
                self.emailArray = returnedArray
                self.peopleTableView.reloadData()
            })
        }
    }
}

extension CreateGroupViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? userCell else {return UITableViewCell()}
        let userImage = UIImage(named: "defaultProfileImage")
        cell.configureCell(withImage: userImage!, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
   
}

extension CreateGroupViewController: UITextFieldDelegate{
}
