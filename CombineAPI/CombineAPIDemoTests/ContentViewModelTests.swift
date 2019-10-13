//
//  ContentViewModelTests.swift
//  CombineAPIDemoTests
//
//  Created by Shinji Kurosawa on 2019/10/12.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Combine
import CombineAPI
import XCTest
@testable import CombineAPIDemo

class ContentViewModelTests: XCTestCase {

    var cancellable: [AnyCancellable] = []

    override func tearDown() {
        cancellable.forEach { $0.cancel() }
        cancellable = []
    }
    
    func testInitialStatus() {
        let viewModel = ContentViewModel(api: MockSuccessAPI())
        guard case .loading = viewModel.loadingStatus else {
            XCTFail("initial status is loading")
            return
        }
    }
    
    func testOnAppear() {
        let successViewModel = ContentViewModel(api: MockSuccessAPI())
        successViewModel.onAppear()
        if case .success(let user) = successViewModel.loadingStatus {
            XCTAssertEqual(user.totalCount, 5, "user model is received")
        }  else {
            XCTFail("should succeed")
        }
        
        let failureViewModel = ContentViewModel(api: MockFailureAPI())
        failureViewModel.onAppear()
        if case .failure(let error) = failureViewModel.loadingStatus {
            XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (Error error 0.)", "Error model is received")
        }  else {
            XCTFail("should fail")
        }
    }
    
    class MockSuccessAPI: APIProtocol {
        func publish<T>(request: T) -> AnyPublisher<T.Response, Error> where T : Request {
            return AnyPublisher(SuccessUserPublisher<T>())
        }
    }
    
    struct SuccessUserPublisher<T: Request>: Publisher {
        
        typealias Output = T.Response
        typealias Failure = Error
        
        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
            _ = subscriber.receive(User(totalCount: 5) as! T.Response)
            subscriber.receive(completion: .finished)
        }
    }
    
    class MockFailureAPI: APIProtocol {
        func publish<T>(request: T) -> AnyPublisher<T.Response, Error> where T : Request {
            return AnyPublisher(FailureUserPublisher<T>())
        }
    }
    
    struct FailureUserPublisher<T: Request>: Publisher {
        
        typealias Output = T.Response
        typealias Failure = Error
        
        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
            subscriber.receive(completion: .failure(NSError(domain: "Error", code: 0, userInfo: nil)))
        }
    }
}
