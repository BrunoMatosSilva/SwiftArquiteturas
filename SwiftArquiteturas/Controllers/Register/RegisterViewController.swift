//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 24/10/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Clousers
    var onRegisterSuccess:(() -> Void)?
    
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        
        view.onRegisterTap = {[weak self] email, password in
            self?.registerTap(email, password)
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Register"
    }
    
    private func registerTap(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.setUserFromApi(email, password) { result in
            switch result {
            case .success(_):
                self.onRegisterSuccess?()
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
