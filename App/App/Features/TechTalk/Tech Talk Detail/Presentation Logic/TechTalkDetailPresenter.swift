//
//  TechTalkDetailPresenter.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright (c) 2018 Federico Trimboli. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TechTalkDetailPresentationLogic {
    func presentDetail(basedOn response: TechTalkDetail.Load.Response)
}

class TechTalkDetailPresenter: TechTalkDetailPresentationLogic {
    weak var viewController: TechTalkDetailDisplayLogic?

    func presentDetail(basedOn response: TechTalkDetail.Load.Response) {
        do {
            let result = try response.result.dematerialize()

            let viewModel = TechTalkDetail.Load.ViewModel(result: .success(mapTechTalkDetailToViewModel(result)))

            self.viewController?.displayDetail(basedOn: viewModel)
        } catch {
            // Add error handling stuff
        }
    }

    private func mapTechTalkDetailToViewModel(_ techTalk: TechTalkDetails) -> TechTalkDetail.TechTalkDetailViewModel {
        let speaker = techTalk.speakers.first!
        return TechTalkDetail.TechTalkDetailViewModel(title: techTalk.title,
                                                      description: techTalk.description,
                                                      speakerName: "\(speaker.firstName) \(speaker.lastName)",
                                                      speakerPhoto: speaker.photoURL,
                                                      speakerGithubUrl: speaker.githubURL,
                                                      reviews: mapReviewsToViewModel(techTalk.reviews))
    }

    private func mapReviewsToViewModel(_ reviews: [Review]) -> [TechTalkDetail.ReviewViewModel] {
        return reviews.map {
            return TechTalkDetail.ReviewViewModel(description: $0.description,
                                                  stars: $0.stars,
                                                  reviewerEmail: $0.reviewerEmail)
        }
    }
}
