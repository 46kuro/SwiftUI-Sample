//
//  CombineAPI.swift
//  CombineAPI
//
//  Created by Shinji Kurosawa on 2019/09/14.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Combine
import Foundation

// 参考: https://heckj.github.io/swiftui-notes/
public protocol APIProtocol: class {
    func request<T: Codable>(from url: URL, resultHandler: @escaping (Result<T, Error>) -> Void)
}

// TODO: Project内にCombineを使う側をCombineAPIExampleとして作成し、GithubでRequestできるかTestする
public class CombineAPI: APIProtocol {
    
    var cancellable: [AnyCancellable] = []
    
    public func request<T: Codable>(from url: URL, resultHandler: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTaskPublisher(for: url) 
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder()) 
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }   
                resultHandler(.failure(error))
            }, receiveValue: { someValue in
                resultHandler(.success(someValue))
            })
            .store(in: &cancellable)
    }
}

extension URLSession.DataTaskPublisher {
    
}
