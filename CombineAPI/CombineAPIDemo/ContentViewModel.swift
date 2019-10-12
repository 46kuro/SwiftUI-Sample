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
        case failure
    }
    
    var cancellable: [AnyCancellable] = []
    
    @Published var loadingStatus: LoadingStatus = .loading
    
    func onApper() {
        request()
    }
    
    // TODO: APIProtocolでAnyPublisherを使用することで、failureおよびsuccessを確認する
    func request(api: APIProtocol = API()) {
        loadingStatus = .loading
        
        api.publish(request: GithubUserRequest())
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                print("failure!!!")
            }, receiveValue: { user in
                print("\(user.totalCount)")
                self.loadingStatus = .success(user)
            })
            .store(in: &cancellable)
    }
}
