//
//  ContentView.swift
//  SwiftUI-Sample
//
//  Created by Shinji Kurosawa on 2019/06/10.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
