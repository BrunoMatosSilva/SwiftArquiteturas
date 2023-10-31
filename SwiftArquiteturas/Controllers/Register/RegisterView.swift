//
//  RegisterView.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 24/10/23.
//

import Foundation
import UIKit

class RegisterView: UIView {
    
    //MARK: - Clousers
    var onRegisterTap: ((_ email: String, _ password: String) -> Void)?
    
    //MARK: - Properts
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.textColor = .darkGray
        
        textField.setLeftPaddingPoints(15)
        
        textField.placeholder = "Endereco de email"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var passwordlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.textColor = .darkGray
        textField.setLeftPaddingPoints(15)
        textField.placeholder = "Senha da conta"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var confirmPasswordlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirmar Senha"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.textColor = .darkGray
        textField.setLeftPaddingPoints(15)
        textField.placeholder = "Confirmar a senha da conta"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var openButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .viewBackgroundColor
        
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Visual Elements
    func setVisualElements() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordlLabel)
        self.addSubview(passwordTextField)
        self.addSubview(confirmPasswordlLabel)
        self.addSubview(confirmPasswordTextField)
        self.addSubview(openButton)
        
        NSLayoutConstraint.activate([
        
            emailLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordlLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            passwordlLabel.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            passwordlLabel.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: self.passwordlLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: self.passwordlLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.passwordlLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            confirmPasswordlLabel.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordlLabel.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            confirmPasswordlLabel.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: self.confirmPasswordlLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: self.confirmPasswordlLabel.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: self.confirmPasswordlLabel.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            openButton.topAnchor.constraint(equalTo: self.confirmPasswordTextField.bottomAnchor, constant: 80),
            openButton.leadingAnchor.constraint(equalTo: self.confirmPasswordTextField.leadingAnchor),
            openButton.trailingAnchor.constraint(equalTo: self.confirmPasswordTextField.trailingAnchor),
            openButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
    
    //MARK: - Actions
    @objc func tappedRegisterButton() {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            self.onRegisterTap?(email, password)
        } else {
            print("Os campos precisam ser preenchidos corretamente.")
        }
    }
}