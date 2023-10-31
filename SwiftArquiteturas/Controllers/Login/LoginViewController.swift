//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 23/10/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Clousers
    var onRegisterTap:(() -> Void)?
    var onLoginSuccessTap:(() -> Void)?
    
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        
        view.onRegisterTap = {[weak self] in
            self?.onRegisterTap?()
        }
        
        view.onOpenTap = {[weak self] email, password in
            self?.openTap(email, password)
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
    }
    
    private func openTap(_ email: String,_ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.getUserFromApi(email, password) { result in
            switch result {
            case .success(_):
                self.onLoginSuccessTap?()
            case .failure(let error):
                self.showMessage("Erro", error.localizedDescription)
            }
        }
    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
