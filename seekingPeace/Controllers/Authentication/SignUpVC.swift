//
//  SignUpVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/21/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    private let signUpView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    private func setUp() {
        signUpView.emailTextField.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
