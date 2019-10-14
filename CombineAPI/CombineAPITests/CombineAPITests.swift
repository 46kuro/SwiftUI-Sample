//
//  CombineAPITests.swift
//  CombineAPITests
//
//  Created by Shinji Kurosawa on 2019/09/14.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Combine
import XCTest
@testable import CombineAPI

class CombineAPITests: XCTestCase {

    let mocks = Mocks()
    var cancellable: [AnyCancellable] = []
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        cancellable.forEach { $0.cancel() }
        cancellable = []
        
        MockURLProtocol.response = nil
        MockURLProtocol.error = nil
        MockURLProtocol.testURLs = [URL?: Data]()
    }
    
    func testResponse() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        
        MockURLProtocol.testURLs = [URL(string: "http://localhost:8080")!: Data(mocks.testResponse.utf8)]
        MockURLProtocol.response = mocks.invalidResponse401
        
        let expectationFailure = expectation(description: "failure")
        let api = API(session: URLSession(configuration: config))
        api.publish(request: TestRequest()).sink(receiveCompletion: { completion in
            guard case .failure(let error) = completion else {
                XCTFail("should be error")
                return
            }
            XCTAssertEqual(error.localizedDescription, "Hoge")
            expectationFailure.fulfill()
        }) { response in
            XCTFail("should not receive response")
        }.store(in: &cancellable)
        wait(for: [expectationFailure], timeout: 1)
    }
}

class TestRequest: Request {
    typealias Response = TestResponse
    var url: URL = URL(string: "http://localhost:8080")!
}

struct TestResponse: Codable {
    let value: Int?
}

class Mocks {

    let testResponse = """
        { "value": 1 }
    """
    
    let invalidResponse = URLResponse(url: URL(string: "http://localhost:8080")!,
                                      mimeType: nil,
                                      expectedContentLength: 0,
                                      textEncodingName: nil)
    
    let validResponse = HTTPURLResponse(url: URL(string: "http://localhost:8080")!,
                                        statusCode: 200,
                                        httpVersion: nil,
                                        headerFields: nil)
    
    let invalidResponse300 = HTTPURLResponse(url: URL(string: "http://localhost:8080")!,
                                           statusCode: 300,
                                           httpVersion: nil,
                                           headerFields: nil)
    let invalidResponse401 = HTTPURLResponse(url: URL(string: "http://localhost:8080")!,
                                             statusCode: 401,
                                             httpVersion: nil,
                                             headerFields: nil)
    
    let networkError = NSError(domain: "NSURLErrorDomain",
                               code: -1004, //kCFURLErrorCannotConnectToHost
                               userInfo: nil)
    
}
