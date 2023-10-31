//
//  Coordinator.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 23/10/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get}
    func start()
    
    init(navigationController: UINavigationController)
}
