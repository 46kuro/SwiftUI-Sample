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

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func testUserPublisher() {
        MockAPI().publish(request: <#T##Request#>)
    }
    
    class MockAPI: APIProtocol {
        func publish<T>(request: T) -> AnyPublisher<T.Response, Error> where T : Request {
            return SuccessUserPublisher()
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
