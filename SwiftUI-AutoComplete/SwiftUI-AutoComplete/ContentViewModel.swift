//
//  ContentViewModel.swift
//  SwiftUI-AutoComplete
//
//  Created by Shinji Kurosawa on 2019/06/18.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ContentViewModel: BindableObject {
    
    let didChange = PassthroughSubject<ContentViewModel, Never>()
    
    func getGithub() {
        
    }
}
