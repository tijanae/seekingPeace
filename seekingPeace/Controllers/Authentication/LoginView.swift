//
//  LoginView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/21/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
//    var crayonBox = CrayonBox()

//    MARK: UIOBJECTS
    
    
    lazy var backdrop: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "plant")
        return img
    }()
    
    lazy var emailTextField: UITextField = {
        let text = UITextField()
        text.text = "enter email"
        text.backgroundColor = CrayonBox.Green.mid
        text.borderStyle = .line
        text.textColor = CrayonBox.White.opaque
        text.layer.borderWidth = 2
        text.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return text
       }()
    
//    var emailTextField = SpTextField(placeholder: "enter email")
       
    lazy var passwordTextField: UITextField = {
        let passWord = UITextField()
        passWord.text = "password"
        passWord.backgroundColor = CrayonBox.Green.mid
        passWord.borderStyle = .line
        passWord.isSecureTextEntry = true
        passWord.textColor = CrayonBox.White.opaque
        passWord.layer.borderWidth = 2
        passWord.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return passWord
       }()
    
    lazy var textSecureButton: UIButton = {
       let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        return button
    }()
    
    lazy var signInError: UILabel = {
        let errorLabel = UILabel()
        return errorLabel
    }()
    
    lazy var loginButton: UIButton = {
        let login = UIButton()
        login.backgroundColor = CrayonBox.Green.mid
        login.layer.borderWidth = 2
        login.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        login.setTitleColor(.white, for: .normal)
        login.setTitle("login", for: .normal)
        return login
       }()
    
    lazy var signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.backgroundColor = CrayonBox.Green.mid
        signUp.layer.borderWidth = 2
        signUp.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        signUp.setTitleColor(.white, for: .normal)
        signUp.setTitle("sign up", for: .normal)
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
        backdropConstraint()
        emailTextConstraint()
        passwordTextConstraint()
        textSecureButtonConstraint()
        signUpContraint()
        loginContraint()
        }
    
    private func backdropConstraint() {
        
        addSubview(backdrop)
        
        backdrop.translatesAutoresizingMaskIntoConstraints = false
        
        [backdrop.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
         backdrop.leadingAnchor.constraint(equalTo: leadingAnchor),
         backdrop.trailingAnchor.constraint(equalTo: trailingAnchor),
         backdrop.bottomAnchor.constraint(equalTo: bottomAnchor)].forEach{$0.isActive = true}
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
    
    private func textSecureButtonConstraint() {
        addSubview(textSecureButton)
        
        textSecureButton.translatesAutoresizingMaskIntoConstraints = false
        
        [textSecureButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor),
         textSecureButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
         textSecureButton.leadingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -50),
         textSecureButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -10)].forEach{$0.isActive = true}
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
