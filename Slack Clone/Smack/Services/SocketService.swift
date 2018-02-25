//
//  SocketService.swift
//  Smack
//
//  Created by Samuel Martin on 02/11/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    var socket : SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    
    func establishConnection() {
         socket.connect()
    }
    
    func closeConnection(){
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler){
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDesc = dataArray[1] as? String else {return}
            guard let channelID = dataArray[2] as? String else {return}
            
            let newChannel = Channel(_id: channelID, name: channelName, description: channelDesc, __v: 0)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userID: String, channelId: String, completion: @escaping CompletionHandler){
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody,userID, channelId, user.name, user.avatarName, user.avatarColour)
        completion(true)
    }
}
