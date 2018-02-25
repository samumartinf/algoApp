//
//  Constants.swift
//  Smack
//
//  Created by Samuel Martin on 18/10/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let BASE_URL = "https://thegoddamchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_ADDUSER = "\(BASE_URL)user/add"
<<<<<<< HEAD
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel/"


//Colours
let SMACK_PURPLE_PLACEHOLDER_COLOUR = #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

//Notifications
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataDidChange")
let NOTIF_CHANNELS_LOADED = Notification.Name("notifChannelLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("notifChannelDetected")

=======


>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"


//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
<<<<<<< HEAD
let BEARER_HEADER = [
    "Authorization":"Bearer \(AuthService.instance.authToke)",
    "Content-Type": "application/json; charset=utf-8"
]
=======
>>>>>>> 06320646689593dd2bf60adad59d91f4e6dcdc57
