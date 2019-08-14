//
//  TimerView.swift
//  SwiftUI-Sample
//
//  Created by Shinji Kurosawa on 2019/08/14.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

// 参考: https://heckj.github.io/swiftui-notes/

import Combine
import SwiftUI

struct TimerView: View {
    
    @ObservedObject var viewModel = TimerViewModel()
    
    var body: some View {
        Text(viewModel.timeString)
            .onAppear(perform: viewModel.onAppear)
    }
}

#if DEBUG
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
#endif


final class TimerViewModel: ObservableObject {
    
    @Published private(set) var timeString: String = "default" 
    
    var timerPublisher = Timer.publish(every: 1.0, on: .main, in: .default)
    var cancellables: [AnyCancellable] = []
    
    private(set) lazy var onAppear: () -> Void = { [weak self] in
        guard let self = self else { return }
        self.timerPublisher
            .autoconnect()
            .map { "\($0)" }
            .sink(receiveValue: { [weak self] in
                self?.timeString = $0
            })
            .store(in: &self.cancellables)
    }
}
