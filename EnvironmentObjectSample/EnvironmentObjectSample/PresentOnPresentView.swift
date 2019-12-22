//
//  PresentOnPresentView.swift
//  EnvironmentObjectSample
//
//  Created by Shinji Kurosawa on 2019/12/22.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import SwiftUI

struct PresentOnPresentView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @UserDefault(.value, defaultValue: "データが入る前のValue")
    static var value: String
    
    var body: some View {
        VStack {
            Text(UserDefault<String>(.value, defaultValue: "データが入る前のValue").wrappedValue)
            Button("値1に更新") { 
                PresentedView.value = "値1"
            }
            Button("値2に更新") { 
                PresentedView.value = "値2"
            }
            Button("画面を閉じる") { 
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct PresentOnPresentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentOnPresentView()
    }
}
