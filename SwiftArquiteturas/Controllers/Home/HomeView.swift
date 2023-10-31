//
//  HomeView.swift
//  SwiftArquiteturas
//
//  Created by Bruno Matos Silva on 31/10/23.
//

import UIKit

class HomeView: UIView {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Essa e a tela Home do Projeto"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    

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
        self.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
        
            textLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
        ])
        
    }
    
}
