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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objectSetUp()

        // Do any additional setup after loading the view.
    }
    
    func objectSetUp() {
        loginView.emailTextField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        loginView.loginButton.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
    }
    
//    MARK: Objective C
    

    @objc func validateFields() {
        guard loginView.emailTextField.hasText, loginView.passwordTextField.hasText else {
            loginView.loginButton.backgroundColor = .darkGray
            loginView.loginButton.isEnabled = false
            return
        }
        loginView.loginButton.isEnabled = true
        loginView.loginButton.backgroundColor = .darkGray
    }
    
    @objc func showSignUp() {
        let signUp = SignUpVC()
        signUp.modalPresentationStyle = .formSheet
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
    
//    MARK: Private Func
    
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
                  let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window else {
                return
//                    "error"
            }
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                window.rootViewController = {
                    let mainTBC = MainTabBarVC()
                    self.navigationController?.pushViewController(mainTBC, animated: true)
                    return mainTBC
                }()
            }, completion: nil)
        }
    }
    
    


}
