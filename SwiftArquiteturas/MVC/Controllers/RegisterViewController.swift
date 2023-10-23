//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 22/10/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    @IBAction func registerButtonTap(_ sender: Any) {
        if let email = emailTextField.text,
            let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
            if password != confirmPassword {
                self.showMessage(title: "Erro", message: "Senhas não conferem")
                
                return
            }
            
            let manager = UserManager(business: UserBusiness())
            
            manager.register(email: email, password: password) {
                userModel in
                self.openHomeView()
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: error?.localizedDescription ?? "")
            }
        }
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func openHomeView() {
        
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
}
