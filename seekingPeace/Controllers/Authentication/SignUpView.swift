//
//  SignUpView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/21/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SignUpView: UIView {

//    var crayonBox = CrayonBox()

// MARK: UIOBJECTS

    lazy var backdrop: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "tea")
        return img
    }()

    lazy var emailTextField = SpTextField(placeholder: "enter email")

    lazy var passwordTextField = SpTextField(placeholder: "enter password")

    lazy var textSecureButton: UIButton = {
       let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        return button
    }()

    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = CrayonBox.Green.mid
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
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
        signUp.backgroundColor = CrayonBox.Green.mid
        signUp.layer.borderWidth = 2
        signUp.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        signUp.setTitleColor(.white, for: .normal)
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
        backdropConstraint()
        emailTextConstraint()
        passwordTextConstraint()
        textSecureButtonConstraint()
        signUpConstraint()
        cancelConstraint()
    }

    private func backdropConstraint() {

        addSubview(backdrop)

        backdrop.translatesAutoresizingMaskIntoConstraints = false

        [backdrop.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
         backdrop.bottomAnchor.constraint(equalTo: bottomAnchor),
         backdrop.leadingAnchor.constraint(equalTo: leadingAnchor),
         backdrop.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach {$0.isActive = true}
    }

    private func emailTextConstraint() {

        addSubview(emailTextField)

        emailTextField.translatesAutoresizingMaskIntoConstraints = false

        [ emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
          emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
          emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
          emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)].forEach {$0.isActive = true}

        }

    private func passwordTextConstraint() {

        addSubview(passwordTextField)

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        [passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)].forEach {$0.isActive = true}

        }

    private func textSecureButtonConstraint() {
        addSubview(textSecureButton)

        textSecureButton.translatesAutoresizingMaskIntoConstraints = false

        [textSecureButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor),
         textSecureButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
         textSecureButton.leadingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -50),
         textSecureButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }

    private func signUpConstraint() {

        addSubview(signUpButton)

        signUpButton.translatesAutoresizingMaskIntoConstraints = false

        [signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
        signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 225),
        signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)].forEach {$0.isActive = true}

        }

    private func cancelConstraint() {

        addSubview(cancelButton)

        cancelButton.translatesAutoresizingMaskIntoConstraints = false

        [cancelButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
         cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
         cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -250)].forEach {$0.isActive = true}
    }

}
