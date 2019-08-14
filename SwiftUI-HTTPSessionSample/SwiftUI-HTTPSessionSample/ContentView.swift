//
//  ContentView.swift
//  SwiftUI-HTTPSessionSample
//
//  Created by Shinji Kurosawa on 2019/06/20.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import UIKit
import SwiftUI

struct ContentView : View {
    @EnvironmentObject var user: User?
    
    var body: some View {
        
        ZStack {
            // TODO: ActivityIndicatorを動かすViewControllerを作成
//            UIActivityIndicatorView()
            
            Text("Hello World")
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
