//
//  HomeViewController.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 31/10/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeView: HomeView = {
        let view = HomeView(frame: .zero)
        
        return view
    }()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
