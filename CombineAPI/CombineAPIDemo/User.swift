//
//  User.swift
//  CombineAPIDemo
//
//  Created by Shinji Kurosawa on 2019/10/09.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Foundation

struct User: Codable {
    let totalCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
    }
}
