//
//  ContentViewModel.swift
//  CombineAPIDemo
//
//  Created by Shinji Kurosawa on 2019/10/09.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Combine
import CombineAPI
import SwiftUI

final class ContentViewModel: ObservableObject {
    
    enum LoadingStatus {
        case loading
        case success(User)
        case failure(Error)
    }
    
    private let api: APIProtocol 
    var cancellable: [AnyCancellable] = []
    
    @Published var loadingStatus: LoadingStatus = .loading
    
    init(api: APIProtocol = API()) {
        self.api = api
    }
    
    func onAppear() {
        requestUserCount()
    }
    
    private func requestUserCount() {
        loadingStatus = .loading
        
        api.publish(request: GithubUserRequest())
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                self.loadingStatus = .failure(error)
            }, receiveValue: { user in
                self.loadingStatus = .success(user)
            })
            .store(in: &cancellable)
    }
}
