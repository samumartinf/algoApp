//
//  ChannelModel.swift
//  Smack
//
//  Created by Samuel Martin on 02/11/2017.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import Foundation

struct Channel : Decodable{
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?
}
