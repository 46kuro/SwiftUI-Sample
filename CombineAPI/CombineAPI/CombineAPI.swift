//
//  CombineAPI.swift
//  CombineAPI
//
//  Created by Shinji Kurosawa on 2019/09/14.
//  Copyright © 2019 Shinji Kurosawa. All rights reserved.
//

import Combine
import Foundation

public protocol SessionManager {
    
}

// 参考: https://heckj.github.io/swiftui-notes/
public protocol APIProtocol: class {
    func publish<T: Request>(request: T) -> AnyPublisher<T.Response, Error>
}

// TODO: Project内にCombineを使う側をCombineAPIExampleとして作成し、GithubでRequestできるかTestする
public class API: APIProtocol {
    
    public enum Method {
        case get
        case post
    }
    
    var cancellable: [AnyCancellable] = []
    
    /// TODO: Mock化しよう
    public init() { }
    
    public func publish<T>(request: T) -> AnyPublisher<T.Response, Error> where T : Request {
        // TODO: Alamofire辺りを使用してAPIClientを作る
        // TODO: URLSessionをStub化することで、正常系と異常系のテストができるようにする（CombineAPIDemoの90行目参照）
        let request = URLRequest(url: request.url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .validate(statusCode: 200..<300)
            .map { $0.data }
            .decode(type: T.Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

// 参考：https://qiita.com/H_Crane/items/4778d7951cd0e1611f5b
extension URLSession.DataTaskPublisher {

    func validate<S: Sequence>(statusCode range: S) -> Self where S.Iterator.Element == Int {
        tryMap { data, response -> Data in
            switch (response as? HTTPURLResponse)?.statusCode {
            case .some(let code) where range.contains(code):
                return data
            case .some(let code) where !range.contains(code):
                throw NSError(domain: "out of statusCode range", code: code)
            default:
                throw NSError(domain: String(data: data, encoding: .utf8) ?? "Network Error", code: 0)  // ※ 仮のエラーコード
            }
        }.upstream
    }
}
