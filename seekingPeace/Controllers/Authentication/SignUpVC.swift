//
//  SignUpVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/21/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpVC: UIViewController {
    
    private let signUpView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    private func setUp() {
        signUpView.emailTextField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        signUpView.passwordTextField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        signUpView.signUpButton.addTarget(self, action: #selector(trySignUp), for: .touchUpInside)
    }
    
//    MARK: Objective C
    
    @objc func validateFields() {
        guard signUpView.emailTextField.hasText, signUpView.passwordTextField.hasText else {
//            button color
            signUpView.signUpButton.backgroundColor = .darkGray
            signUpView.signUpButton.isEnabled = false
            return
        }
        signUpView.cancelButton.isEnabled = true
//        button color
        signUpView.backgroundColor = .white
    }
    
    @objc func trySignUp() {
        guard let email = signUpView.emailTextField.text, let password = signUpView.passwordTextField.text else {
            showAlert(with: "ERROR", and: "Incomplete Field")
            return
        }
        guard email.isVaildEmail else {
            showAlert(with: "Error", and: "Please enter a valid email")
            return
        }
        guard password.isValidPassword else {
            showAlert(with: "Error", and: "Please enter a valid password. Password must have at least 8 characters")
            return
        }
        
        FirebaseAuthService.manager.createNewUser(email: email.lowercased(), password: password) { [weak self] (result) in
            self?.accntCreationResponse(with: result)
        }
    }
    
// MARK: Private Funcs
    
    private func showAlert(with title: String, and message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    
    private func accntCreationResponse(with result: Result<User, Error>) {
        DispatchQueue.main.async { [weak self] in
            switch result {
            case .failure(let error):
                self?.showAlert(with: "Error creating User", and: "An error occured while creating new account \(error)")
            case .success(let user):
                FirestoreService.manager.createAppUser(user: AppUser(from: user)) { [weak self] newResult in
                    self?.handleCreatedUserInFirestore(result: newResult)
                    self?.showAlert(with: "Congrats!", and: "You've Joined this App")
                }
            }
        }
    }
    
    private func handleCreatedUserInFirestore(result: Result<(), Error>) {
        switch result {
        case .success:
            guard let windowScene = UIApplication.shared.connectedScenes.first as?
                    UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window else {return}
            UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "main") as! MainTabBarVC
                    nextViewController.modalPresentationStyle = .fullScreen
                self.present(nextViewController, animated:true, completion:nil)
                }, completion: nil)
            
        case .failure(let error):
            self.showAlert(with: "Error creating user", and: "An error occured while creating new account \(error)")
        }
    }
    
    

}
