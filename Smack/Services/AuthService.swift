//
//  AuthService.swift
//  Smack
//
//  Created by Samuel Martin on 20/10/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard //As in description, it lets us save some data that will be avaiable throught the time the app is installed in the phone. Thus, if you have logged in, you can remember that it has, hence he is not prompted to log int againg later. We will be storing the authorization token, the user email and the registering email. However, be careful, it is not too secure, don't save passwords.
    
    var isLogedIn: Bool{
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        } set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    var authToke: String{
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        } set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    var userEmail: String{
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
        } set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        let header = HEADER
        
        let body: [String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil{
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func loginUser(email: String, password: String, completionHandler: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
//                if let json = response.result.value as? Dictionary<String, Any>{
//                    if let email = json["user"] as? String{
//                        self.userEmail = email
//                    }
//                    if let token = json["token"] as? String {
//                        self.authToke = token
//                    }
//                }
                
                //Using SwiftyJSON
                guard let data = response.data else{return}
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToke = json["token"].stringValue
                
                self.isLogedIn = true
                completionHandler(true)
                
            } else {
                completionHandler(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
    func createUser(name: String, email: String, avatarName: String, avatarColour: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": email,
            "avatarName": avatarName,
            "avatarColor": avatarColour
        ]
        
<<<<<<< HEAD
        
        Alamofire.request(URL_ADDUSER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil{
                guard let data = response.data else{return}
                self.setUserInfo(data: data)
=======
        let header = [
            "Authorization":"Bearer \(AuthService.instance.authToke)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(URL_ADDUSER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil{
                guard let data = response.data else{return}
                let json = JSON(data: data)
                let id = json["_id"].stringValue
                let colour = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                
                UserDataService.instance.setUserData(id: id, colour: colour, avatarName: avatarName, email: email, name: name)
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as? Any)
            }
        }
        
    }
    
<<<<<<< HEAD
    func findUserByEmail(completion: @escaping CompletionHandler){
        
        Alamofire.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                self.setUserInfo(data: data)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func setUserInfo(data: Data) {
        let json = JSON(data: data)
        let id = json["_id"].stringValue
        let colour = json["avatarColor"].stringValue
        let avatarName = json["avatarName"].stringValue
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        
        UserDataService.instance.setUserData(id: id, colour: colour, avatarName: avatarName, email: email, name: name)
    }
    
=======
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
}
