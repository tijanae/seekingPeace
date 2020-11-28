//
//  SignUpView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/21/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
//    MARK: UIOBJECTS
    
    lazy var emailTextField: UITextField = {
        let text = UITextField()
        text.text = "email"
        text.borderStyle = .line
        return text
    }()
    
    lazy var passwordTextField: UITextField = {
        let passWord = UITextField()
        passWord.text = "password"
        passWord.borderStyle = .line
        return passWord
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle( "cancel", for: .normal)
        return button
    }()
    
    lazy var signInError: UILabel = {
        let errorLabel = UILabel()
        errorLabel.text = "HELLOOO?!?!?!?"
        return errorLabel
    }()
    
    lazy var signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.backgroundColor = .blue
        signUp.setTitle("sign up", for: .normal)

        return signUp
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints() {
        emailTextConstraint()
        passwordTextConstraint()
        signUpConstraint()
        cancelConstraint()
    }

    
    private func emailTextConstraint() {
        
        addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        [ emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
          emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
          emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
          emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)].forEach{$0.isActive = true}

        
        }
        
    private func passwordTextConstraint() {
        
        addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        [passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)].forEach{$0.isActive = true}
            
        }
        
        
    private func signUpConstraint() {
        
        addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        [signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
        signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200),
        signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)].forEach{$0.isActive = true}
        }
    
    private func cancelConstraint() {
        
        addSubview(cancelButton)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
         cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
         cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 100)].forEach {$0.isActive = true}
    }
    

}
