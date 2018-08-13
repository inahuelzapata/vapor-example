//
//  AddReviewViewController.swift
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

protocol AddReviewDisplayLogic: class { }

class AddReviewViewController: UIViewController, AddReviewDisplayLogic {
    var interactor: AddReviewBusinessLogic?
    var router: (NSObjectProtocol & AddReviewRoutingLogic & AddReviewDataPassing)?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = AddReviewInteractor()
        let presenter = AddReviewPresenter()
        let router = AddReviewRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}