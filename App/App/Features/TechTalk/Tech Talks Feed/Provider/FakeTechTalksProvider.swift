//
//  TechTalksWorker.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright (c) 2018 Federico Trimboli. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation
import Moya
import Result

protocol TechTalksProvideable {
    func provide(completion: @escaping (Result<[TechTalk], NSError>) -> Void)
}

class FakeTechTalksProvider: TechTalksProvideable {
    func provide(completion: @escaping (Result<[TechTalk], NSError>) -> Void) {
        let stubProvider = MoyaProvider<TechTalksEndpoint>(stubClosure: MoyaProvider.immediatelyStub)
        stubProvider.request(.get) { result in
            do {
                let response = try result.dematerialize()

                completion(.success(try response.map([TechTalk].self)))
            } catch {
                completion(.failure(NSError(domain: "FakeProvider Error", code: 600, userInfo: nil)))
            }
        }
    }
}