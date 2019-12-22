//
//  UserDefaultPropertyWrapper.swift
//  EnvironmentObjectSample
//
//  Created by Shinji Kurosawa on 2019/12/22.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Combine
import Foundation

@propertyWrapper struct UserDefault<T> {
    
    enum Key: String {
        case value
    }
    
    let key: Key
    let defaultValue: T

    init(_ key: Key, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key.rawValue) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key.rawValue)
        }
    }
}
