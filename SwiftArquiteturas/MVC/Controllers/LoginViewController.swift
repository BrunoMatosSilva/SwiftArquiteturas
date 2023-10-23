//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 22/10/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var registerButtonTapped: UIButton!
    @IBOutlet weak var openButtonTapped: UIButton!
    
    
    
    @IBAction func openButtonTap(_ sender: Any) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            manager.login(email: email, password: password) {
                userModel in
                self.openHomeView()
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: error?.localizedDescription ?? "")
            }
        }
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
        
        let registerView = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        registerView.modalPresentationStyle = .fullScreen
        self.present(registerView, animated: true)
        
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
