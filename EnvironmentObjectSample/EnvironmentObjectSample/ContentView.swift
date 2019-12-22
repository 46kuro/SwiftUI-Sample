//
//  ContentView.swift
//  EnvironmentObjectSample
//
//  Created by Shinji Kurosawa on 2019/12/22.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showsPresentedView = false
    
    var body: some View {
        VStack {
            Text(UserDefault<String>(.value, defaultValue: "データが入る前のValue").wrappedValue)
            Button("モーダルを開く") { 
                self.showsPresentedView.toggle()
            }.sheet(isPresented: $showsPresentedView) {
                PresentedView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
