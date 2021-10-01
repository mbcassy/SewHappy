//
//  AddFabricView.swift
//  SewHappy
//
//  Created by Cassy on 10/1/21.
//

import UIKit

class AddFabricView: UIView {
    
    lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 44))
        navBar.backgroundColor = .white
        return navBar
    }()
    
    var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Enter a name for the fabric."
        nameTextField.textAlignment = .left
        nameTextField.borderStyle = .roundedRect
        return nameTextField
    }()
    
    var purchasedFromTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Where did you buy the fabric?"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var quantityTextField: UITextField = {
        let quantityTextField = UITextField()
        quantityTextField.placeholder = "3"
        quantityTextField.textAlignment = .left
        quantityTextField.borderStyle = .roundedRect
        return quantityTextField
    }()
    
    var addImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        button.setTitle("Add Picture", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
    
    func setupConstraints() {
        self.backgroundColor = .white
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.navBar.translatesAutoresizingMaskIntoConstraints = false
        self.quantityTextField.translatesAutoresizingMaskIntoConstraints = false
        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.purchasedFromTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.stackView.addArrangedSubview(nameTextField)
        self.stackView.addArrangedSubview(quantityTextField)
        self.stackView.addArrangedSubview(purchasedFromTextField)
        self.stackView.addArrangedSubview(addImageButton)
        
        self.addSubview(navBar)
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            self.navBar.topAnchor.constraint(equalTo: self.topAnchor),
            self.navBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor),
            self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
