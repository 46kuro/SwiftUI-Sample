//
//  ContentView.swift
//  CombineAPIDemo
//
//  Created by Shinji Kurosawa on 2019/10/08.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Combine
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
     
    var body: some View {
        VStack { () -> AnyView in 
            switch viewModel.loadingStatus {
            case .loading:
                return AnyView(Text("Loading!!"))
            case .success(let user):
                return AnyView(Text("Hello World"))
            case .failure:
                return AnyView(Text("failure!!"))
            }
        }.onAppear { 
            self.viewModel.onApper()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
