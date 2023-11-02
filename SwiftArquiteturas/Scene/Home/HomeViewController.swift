//
//  HomeViewController.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 02/11/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeDisplayLogic: AnyObject
{
  func displaySomething(viewModel: Home.Something.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic
{

    
  var interactor: HomeBusinessLogic?
  var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

  // MARK: Object lifecycle

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
    
    override func loadView() {
        self.view = homeView
    }

  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
    
    lazy var homeView: HomeView = {
        let view = HomeView(frame: .zero)
        
        return view
    }()
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Home.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Home.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
