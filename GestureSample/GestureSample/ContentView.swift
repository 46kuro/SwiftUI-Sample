//
//  ContentView.swift
//  GestureSample
//
//  Created by Shinji Kurosawa on 2019/10/28.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState var isDetectingLongPress = false
    
    var body: some View {
        Text("Hello World")
            .gesture(LongPressGesture()
                .updating($isDetectingLongPress) { currentState, gestureState, transaction in
                    print("--- updating")
                    print(currentState)
                    print(gestureState)
                    print(transaction)
                    print("------------")
                    gestureState = currentState
                }
                .onChanged({ bool in
                    print("onChanged: \(bool)")
                })
                .onEnded({ bool in
                    print("onEnded: \(bool)")
                })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
