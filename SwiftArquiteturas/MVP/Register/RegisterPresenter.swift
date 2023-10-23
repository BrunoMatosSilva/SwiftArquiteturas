//
//  RegisterPresenter.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 23/10/23.
//

import Foundation

protocol RegisterPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
}

class RegisterPresenter {
    var delegate: RegisterPresenterDelegate?
    
    func register(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: userModel.email, password: userModel.password) { model in
            self.goHome()
        } failureHandler: { error in
            self.delegate?.showMessage(title: "Error", message: error?.localizedDescription ?? "")
        }

    }
    
    func goHome() {
        self.delegate?.goHome()
        
    }
}
