//
//  LoginVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/21/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    private let loginView = LoginView()

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        objectSetUp()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }

    func objectSetUp() {
        loginView.emailTextField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        loginView.loginButton.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
        loginView.textSecureButton.addTarget(self, action: #selector(viewPassword), for: .touchUpInside)
        loginView.emailTextField.addTarget(self, action: #selector(deleteTextPlaceholder), for: .editingDidBegin)
    }

// MARK: Objective C

    @objc func validateFields() {
//        if loginView.emailTextField.text == "enter email" {
//            loginView.emailTextField.text = ""
//        }
//        loginView.emailTextField.text = ""

        guard loginView.emailTextField.hasText, loginView.passwordTextField.hasText else {
            loginView.loginButton.backgroundColor = .darkGray
            loginView.loginButton.isEnabled = false
            return
        }
        loginView.loginButton.isEnabled = true
        loginView.loginButton.backgroundColor = UIColor(red: 8/255.0, green: 100/255.0, blue: 8/255.0, alpha: 0.7)
    }

    @objc func showSignUp() {
        let signUp = SignUpVC()
        signUp.modalPresentationStyle = .fullScreen
        present(signUp, animated: true, completion: nil)
    }

    @objc func tryLogin() {
        guard let email = loginView.emailTextField.text, let password = loginView.passwordTextField.text else {
            showAlert(with: "ERROR", and: "Incomplete Field")
            return
        }

        guard email.isVaildEmail else {
            showAlert(with: "Error", and: "Please enter a valid email")
            return
        }

        guard password.isValidPassword else {
            showAlert(with: "Error", and: "Please enter a vaild password. Passwords must have at least 8 characters")
            return
        }

        FirebaseAuthService.manager.loginUser(email: email.lowercased(), password: password) { (result) in
            self.handleLogin(with: result)
        }
    }

    @objc func viewPassword() {
        if loginView.passwordTextField.isSecureTextEntry == true {
            loginView.passwordTextField.isSecureTextEntry = false
            loginView.textSecureButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            loginView.passwordTextField.isSecureTextEntry = true
            loginView.textSecureButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }

    }

    @objc func deleteTextPlaceholder() {
        loginView.emailTextField.text = ""
    }

// MARK: Private Func

    private func showAlert(with title: String, and message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

    private func handleLogin(with result: Result<(), Error>) {
        switch result {
        case .failure(let error):
            showAlert(with: "Error", and: "Could not log in. Error: \(error)")
        case .success:
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window else {return}
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                window.rootViewController = MainTabBarVC()
//                window.rootViewController = {
//                    let mainTBC = MainTabBarVC()
//                    self.navigationController?.pushViewController(mainTBC, animated: true)
//                    return mainTBC
//                }()
            }, completion: nil)
        }
    }

}
