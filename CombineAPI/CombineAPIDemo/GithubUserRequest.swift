//
//  GithubUserRequest.swift
//  CombineAPIDemo
//
//  Created by Shinji Kurosawa on 2019/10/11.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import CombineAPI
import Foundation

class GithubUserRequest: Request {
    
    typealias Response = User
    
    var url: URL { URL(string: "https://api.github.com/search/users?q=46kuro")! }
} 
