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
    
    override func setUp() {
        
    }

    override func tearDown() {
        cancellable.forEach { $0.cancel() }
        cancellable = []
    }
    
    func testUserPublisher() {
        MockAPI()
            .publish(request: GithubUserRequest())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssert(1==1, "completion is called")
                case .failure:
                    XCTFail("should success API")
                }
            }) { user in
                XCTAssertEqual(user.totalCount, 5, "user model is received")
            }
            .store(in: &cancellable)
    }
    
    class MockAPI: APIProtocol {
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
}
