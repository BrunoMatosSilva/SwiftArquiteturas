//
//  LoginPresenter.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 23/10/23.
//

import Foundation

protocol LoginPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
}

class LoginPresenter {
    var delegate: LoginPresenterDelegate?
    
    func login(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: userModel.email, password: userModel.password) { model in
            self.goHome()
        } failureHandler: { error in
            self.delegate?.showMessage(title: "Error", message: error?.localizedDescription ?? "")
        }
    }
    
    func goHome() {
        self.delegate?.goHome()
        
    }
}
