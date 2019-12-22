//
//  PresentedView.swift
//  EnvironmentObjectSample
//
//  Created by Shinji Kurosawa on 2019/12/22.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct PresentedView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var showsPresentedView = false
    @UserDefault(.value, defaultValue: "データが入る前のValue")
    static var value: String
    
    var body: some View {
        VStack {
            Text(PresentedView.value)
            Button("値1に更新") { 
                PresentedView.value = "値1"
            }
            Button("値2に更新") { 
                PresentedView.value = "値2"
            }
            Button("画面を閉じる") { 
                self.presentationMode.wrappedValue.dismiss()
            }
            Button("モーダルを開く") { 
                self.showsPresentedView.toggle()
            }.sheet(isPresented: $showsPresentedView) {
                PresentOnPresentView()
            }
        }
    }
}

struct PresentedView_Previews: PreviewProvider {
    static var previews: some View {
        PresentedView()
    }
}
