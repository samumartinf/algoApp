 //
//  File.swift
//  Smack
//
//  Created by Samuel Martin on 02/11/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
 
 class MessageService{
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var selectedChannel : Channel?
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            guard let data = response.data else { return }
            do{
                self.channels = try JSONDecoder().decode([Channel].self, from: data)
            } catch let error {
                debugPrint(error)
            }
            NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
        }
    }
    func clearMessages() {
        messages.removeAll()
    }
    
    func clearChannels() {
        channels.removeAll()
    }
    
    func findAllMessagesForChannels(channelId : String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                self.clearMessages()
                guard let data = response.data else { return }
                if let json = JSON(data: data).array {
                    for item in json {
                        let messageBody = item["messageBody"].stringValue
                        let channelId = item["channelId"].stringValue
                        let id = item["_id"].stringValue
                        let userName = item["userName"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                        let timeStamp = item["timeStamp"].stringValue
                        let userId = item["userId"].stringValue
                        
                        let message = Message(_id: id, messageBody: messageBody, userId: userId, channelId: channelId, userName: userName, userAvatar: userAvatar, userAvatarColor: userAvatarColor, __v: 0, timeStamp: timeStamp)
                        self.messages.append(message)
                    }
                    print(self.messages)
                    completion(true)
                }
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
 
 }