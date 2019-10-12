//
//  Request.swift
//  CombineAPI
//
//  Created by Shinji Kurosawa on 2019/10/11.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Foundation

public protocol Request: class {
    associatedtype Response where Response: Codable
    
    var url: URL { get }
    var method: API.Method { get }
    var parameters: [String: String]? { get }
    var headers: [String: String]? { get }
}

public extension Request {
    var method: API.Method {
        return .get
    }
    
    var parameters: [String: String]? {
        return nil
    }
    
    var headers: [String: String]? {
        return nil
    }   
}
