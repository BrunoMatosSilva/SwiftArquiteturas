//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 23/10/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    let presenter: LoginPresenter = LoginPresenter()
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            
            let userModel = UserModel(email: email, password: password)
            
            presenter.login(userModel: userModel)
            
        }
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let register = storyboard.instantiateViewController(withIdentifier: "registerViewController") as! RegisterViewController
        
        register.modalPresentationStyle = .fullScreen
        
        self.present(register, animated: true)
    }
}

extension LoginViewController: LoginPresenterDelegate {
    
    func goHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let home = storyboard.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        
        home.modalPresentationStyle = .fullScreen
        
        self.present(home, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
