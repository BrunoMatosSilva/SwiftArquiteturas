//
//  UserModel.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 17/10/23.
//

import Foundation

struct UserModel: Codable {
    let email: String
    let password: String
    
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
