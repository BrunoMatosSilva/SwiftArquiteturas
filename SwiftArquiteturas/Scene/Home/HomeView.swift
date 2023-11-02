//
//  HomeView.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 02/11/23.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    lazy var labelWelcome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem vindo ao App Login VIP"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemMint
        setAddElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAddElements() {
        addSubview(labelWelcome)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            labelWelcome.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelWelcome.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
}
