//
//  TechTalksViewController.swift
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

protocol TechTalksDisplayLogic: class {
    func displaySomething(viewModel: TechTalks.Something.ViewModel)
}

class TechTalksViewController: UIViewController, TechTalksDisplayLogic {
    var interactor: TechTalksBusinessLogic?
    var router: (NSObjectProtocol & TechTalksRoutingLogic & TechTalksDataPassing)?
    @IBOutlet var feedTableView: UITableView!

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
        let interactor = TechTalksInteractor()
        let presenter = TechTalksPresenter()
        let router = TechTalksRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    func doSomething() {
        let request = TechTalks.Something.Request()
        interactor?.doSomething(request: request)
    }

    func displaySomething(viewModel: TechTalks.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
