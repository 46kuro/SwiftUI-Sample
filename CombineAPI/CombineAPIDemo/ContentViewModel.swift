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
    
    func loadingViewOnApper() {
        let publisher = URLSession.shared.dataTaskPublisher(for: URL(string: "https://api.github.com/search/users?q=46kuro")!)
        request(publisher: publisher)
    }
    
    private func request<T: Publisher>(publisher: T) {
        loadingStatus = .loading
        publisher
            .map {
                // TODO: PublisherのOutputの型をDataで縛る実装方針を考える
                // URLSession.DataTaskPublisherを使用して、Mockを差し込みたい
                let output = $0 as! (data: Data, response: URLResponse)
                return output.data    
            }
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
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

extension Publisher {
    typealias Output = (data: Data, response: URLResponse)
}
