//
//  AddReviewModels.swift
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
import Result
import UIKit

enum AddReview {

    enum Save {
        struct Request {
            var description: String
            var stars: Double
            var email: String
        }

        struct Response {
            var result: Result<Review, NSError>
        }

        struct ViewModel {
            var result: Result<Bool, NSError>
        }
    }
}
