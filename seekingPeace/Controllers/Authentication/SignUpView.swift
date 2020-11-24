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
//        text.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return text
    }()
    
    lazy var passwordTextField: UITextField = {
        let passWord = UITextField()
        passWord.text = "password"
        passWord.borderStyle = .line
//        passWord.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return passWord
    }()
    
    lazy var cancelButton: UIButton = {
        let login = UIButton()
        return login
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
//        signUp.addTarget(self, action: #selector(trySignUp), for: .touchUpInside)
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
             signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200),
             signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)].forEach{$0.isActive = true}
        }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
