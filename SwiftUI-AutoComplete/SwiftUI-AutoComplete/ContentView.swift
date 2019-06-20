//
//  ContentView.swift
//  SwiftUI-AutoComplete
//
//  Created by Shinji Kurosawa on 2019/06/17.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextField($text, 
                      placeholder: Text("テキストを入力"), 
                      onEditingChanged: { bool in
            }) { 
                
            }
            
            List {
                Section(header: Text("セクション1")) {
                    Text("結果なし")
                }
                
            }
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
