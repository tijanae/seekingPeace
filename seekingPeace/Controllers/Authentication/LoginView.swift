//
//  LoginView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/21/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class LoginView: UIView {

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
    
    lazy var signInError: UILabel = {
        let errorLabel = UILabel()
        return errorLabel
    }()
    
    lazy var loginButton: UIButton = {
        let login = UIButton()
        login.backgroundColor = .white
        login.setTitleColor(.blue, for: .normal)
        login.setTitle("login", for: .normal)
//        login.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
        return login
       }()
    
    lazy var signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.backgroundColor = .white
        signUp.setTitleColor(.blue, for: .normal)
        signUp.setTitle("sign up", for: .normal)
//        signUp.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
        return signUp
       }()
    
//    MARK: init
    
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
        signUpContraint()
        loginContraint()
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
        
        
    private func signUpContraint() {
        addSubview(signUpButton)

        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        [signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
        signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250),
        signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -75)].forEach{$0.isActive = true}
        }
    
    private func loginContraint() {
        addSubview(loginButton)

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        [loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
         loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -275)].forEach{$0.isActive = true}
        }

}
