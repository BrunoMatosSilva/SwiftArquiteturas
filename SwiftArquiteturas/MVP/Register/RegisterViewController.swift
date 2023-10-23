//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 23/10/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    let presenter :RegisterPresenter = RegisterPresenter()
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
            
            if password != confirmPassword {
                self.showMessage(title: "Error", message: "Senhas nao conferem")
                
                return
            }
            
            let userModel = UserModel(email: email, password: password)
            
            presenter.register(userModel: userModel)
        }
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let login = storyboard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
        
        login.modalPresentationStyle = .fullScreen
        
        self.present(login, animated: true)
    }
}

extension RegisterViewController: RegisterPresenterDelegate {
    
    func goHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let home = storyboard.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        
        home.modalPresentationStyle = .fullScreen
        
        self.present(home, animated: true)
    }
    
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
